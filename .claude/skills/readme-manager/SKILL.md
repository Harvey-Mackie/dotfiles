---
name: writing-readme-documents 
description: analysing repositories and creating concise readme documents as a result 
---

# README Document Skill 
---
The skill analyses a repository's contents and existing README (if present), scores the existing README then incrementally adds improvements to the README until the score has been maxisimed or a ceiling has been reached.

The workflow is:
1. Analyse codebase and README
2. Score existing README 
3. Improve 
4. Re-score
5. If score is satisifactory -> Output result. Otherwise, return to step 3.

## Core Principles - How should the README look? 

### 1. Follow the `gold-standard` template 
The template defined at [./TEMPLATE-README.md](./TEMPLATE-README.md) is the `gold-standard` for a README. 

Deviaton from the template is only permitted if a section is genuinely not relevant. Or an additional section adds a great deal of contxt.

### 2. Be clear and concise 
There is nothing worse than a README which requires significant brain capacity to read. The document must be simple and provide enough instructions to get you up and running with the installation and basic commands.

Failing to do so the README has failed it's purpose of [how users can get started with the project](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-readmes#about-readmes)

### 3. Be up to date 
There is nothing worse than an out-of-date README. The document should be 100% in alignment with the codebase.


## Workflow 

### Step 1 - Analyse 
Explore the codebase before reading the README. 
This ensures the README is validated against ground truth rather than taken at face value.
Collect the following:
- Repo name — from directory name, pyproject.toml, package.json, go.mod, etc.
- Stack — language, runtime, dependency manager
- Entry points — main.py, cli.py, index.ts, Makefile, docker-compose.yml, etc.
- Top-level structure — directories and key files
- Prerequisites — tools, services, or runtimes the project depends on
- Existing badges, licence, CI config

Then read the existing README (if present). Use the ground truth above to validate it.
If no README exists, score is 0/100 and proceed directly to Step 3.

### Step 2 - Score Existing README
Score the README out of **100** across three principles. Each principle maps to specific criteria — every criterion is pass/fail with fixed point values. No partial marks unless stated.
 
#### Principle 1: Template Conformance — 40 points
 
The gold-standard template is defined in [./TEMPLATE-README.md](./TEMPLATE-README.md). Score each required section:
 
| Section | Criteria | Points |
|---|---|---|
| Title & Badges | H1 title present and matches repo name | 4 |
| | At least one badge present | 3 |
| | Badges use valid markdown syntax | 3 |
| Overview | Section exists with content | 2 |
| | Explains *why* the repo exists (motivation/problem) | 6 |
| | Explains *what* it does (behaviour/output) | 6 |
| Installation | Prerequisites listed | 3 |
| | Prerequisites include links | 2 |
| | At least one shell command in a fenced `sh` block | 3 |
| Usage | Section exists | 2 |
| | Snippets use fenced `sh` blocks with `$` prefix | 3 |
| | Snippets include expected output as a `//` comment | 3 |
| Structure | Folder tree present in a fenced `sh` block | 4 |
| References | Section exists with at least one valid markdown link | 4 |
 
Penalise **-5** if the Overview is a single sentence that addresses neither why nor what with any depth.
 
#### Principle 2: Clarity & Conciseness — 35 points
 
A README has failed its purpose if it requires significant effort to read. Score against:
 
| Criterion | Points |
|---|---|
| No section requires more than one read to understand | 10 |
| Installation gets a new user running without external guesswork | 10 |
| Usage examples are self-contained (copy-paste works) | 10 |
| No redundant content — each section says something distinct | 5 |
 
#### Principle 3: Up to Date — 25 points
 
The README must be 100% in alignment with the codebase. Score against ground truth from Step 1:
 
| Criterion | Points |
|---|---|
| Stack references match actual stack (e.g. no `pip install` for a Node project) | 8 |
| Commands and entry points are accurate | 8 |
| Folder structure reflects actual repo layout | 5 |
| Prerequisites match what the codebase actually requires | 4 |
 
#### Scoring Tiers
 
| Score | Label | Action |
|---|---|---|
| 90–100 | Excellent | Output as-is with minor notes |
| 75–89 | Good | Targeted fixes, re-score |
| 50–74 | Needs Work | Full section rewrites required |
| 0–49 | Poor / Missing | Generate from scratch |
 
#### Score Presentation
 
Present scores in this format before making any changes:
 
```
## README Score: XX/100 — {Tier}
 
| Principle | Score | Max |
|---|---|---|
| Template Conformance | X | 40 |
| Clarity & Conciseness | X | 35 |
| Up to Date | X | 25 |
| **Total** | **X** | **100** |
 
### Notes
- Template Conformance: {specific findings}
- Clarity & Conciseness: {specific findings}
- Up to Date: {specific findings}
```
 
---


### Step 3: Improve
 
Work through failing criteria in descending score-impact order: Up to Date → Clarity → Template Conformance.
 
Rules:
 
- Pull all content from the codebase — do not invent prerequisites, commands, or paths
- Where codebase evidence is absent, use `{TODO: ...}` rather than guessing
- Do not change content that already passes unless it conflicts with ground truth
- All shell snippets must use fenced `sh` blocks, `$` prefix, and `// output` comments
- Use British English when writing READMEs 

---

### Step 4: Re-score
 
Apply the full rubric to the improved README. Present a delta table:
 
```
| Principle | Before | After | Δ |
|---|---|---|---|
| Template Conformance | X | X | +X |
| Clarity & Conciseness | X | X | +X |
| Up to Date | X | X | +X |
| **Total** | **X** | **X** | **+X** |
```
 
If a criterion did not improve, explain why — typically missing codebase evidence or a structural limitation.
 
---

### Step 5: Output or Iterate
 
If score ≥ 90, output the final README as a complete markdown file. Do not summarise or truncate.
 
If score < 90, return to Step 3 and address the next highest-impact failing criteria. Continue until the score stops improving or a ceiling is reached.
 
State any remaining `{TODO}` items and what information would be needed to close them.
 
---
