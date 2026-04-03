-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Copy GitHub permalink (remote + branch + relative path + line) to clipboard
vim.keymap.set("n", "<leader>yp", function()
  local remote = vim.fn.system("git remote get-url origin 2>/dev/null"):gsub("%s+$", "")
  if remote == "" then
    vim.notify("No git remote found", vim.log.levels.WARN)
    return
  end
  -- normalise SSH → HTTPS and strip .git suffix
  remote = remote:gsub("^git@github%.com:", "https://github.com/"):gsub("%.git$", "")
  local branch = vim.fn.system("git branch --show-current 2>/dev/null"):gsub("%s+$", "")
  local root = vim.fn.system("git rev-parse --show-toplevel 2>/dev/null"):gsub("%s+$", "")
  local abs = vim.fn.expand("%:p")
  local rel = abs:sub(#root + 2) -- strip root + trailing slash
  local line = vim.fn.line(".")
  local url = remote .. "/blob/" .. branch .. "/" .. rel .. "#L" .. line
  vim.fn.setreg("+", url)
  vim.notify("Copied: " .. url)
end, { desc = "Yank GitHub permalink to clipboard" })
