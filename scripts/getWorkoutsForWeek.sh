#!/bin/bash

# Personal method using a personal repo - please ignore (or can tweak to your own needs if you want ;)
# This script is for getting my Garmin data for the week
getWorkoutsForWeek() {
  local GARMIN_SERVER=/Users/harveymackie/Documents/repos/Ascend/server
  local DEFAULT_USER=123
  local WORKOUT_WEEK=$1
  local API_PORT="${ASCEND_API_PORT:-8001}"
  local API_BASE_URL="http://localhost:$API_PORT"
  local api_log="${TMPDIR:-/tmp}/ascend-api-get-workouts.log"
  local api_pid=""
  local started_api=0
  local curl_status=0

  # 1. Start Ascend API (this is a private repo...for now)
  if ! nc -z localhost "$API_PORT" >/dev/null 2>&1; then
    (
      cd "$GARMIN_SERVER" &&
        pip3 install -r requirements.txt &&
        exec env PORT="$API_PORT" python3 -m uvicorn main:app --host 0.0.0.0 --port "$API_PORT"
    ) >"$api_log" 2>&1 &
    api_pid=$!
    started_api=1
    sleep 5
  fi

  # 2. Can skip the login part as it's already there...just need to verify the file exists
  if [ ! -d "$GARMIN_SERVER/.garmin_tokens/$DEFAULT_USER" ]; then
    echo "The user does not exist...let's try create it"

    curl -fsS -X POST "$API_BASE_URL/api/garmin/connect" \
      -H "x-user-id: $DEFAULT_USER" \
      -H "Content-Type: application/json" \
      -d "{\"email\": \"$GARMIN_EMAIL\", \"password\": \"$GARMIN_PASSWORD\"}"
  fi

  # 3. Get workouts
  local workouts_json=""
  workouts_json=$(curl -fsS "$API_BASE_URL/api/workouts/weekly?week=$WORKOUT_WEEK" \
    -H "x-user-id: $DEFAULT_USER")

  # 4. Keep only actual completed activities
  curl_status=$?
  if [[ "$curl_status" -eq 0 ]]; then
    JSON_INPUT="$workouts_json" python3 - <<'PYTHON'
import json
import os
import sys

payload = json.loads(os.environ["JSON_INPUT"])
payload["data"] = [item for item in payload.get("data", []) if item.get("isActivity") is True]
json.dump(payload, sys.stdout, separators=(",", ":"))
print()
PYTHON
    curl_status=$?
  fi
  if [[ "$started_api" -eq 1 ]]; then
    kill "$api_pid" >/dev/null 2>&1
    wait "$api_pid" 2>/dev/null
  fi

  return "$curl_status"
}
