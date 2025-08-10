# INIT Scripts
> This part is optional

One challenge with switching between different machines is varying file structures. My philosphy is all custom user files/folders should be located at the same location regardless of the device. The common structure allows for faster navigation and reduces the cognative load of remembering where are your notes or repos saved.

By ensuring all my key resources are on GitHub, achieving this is simple and ensures all of my machines are in sync at all times.

Modify the GitHub repo links to suit your own needs. Ask yourself, What repos do you reference/work in? Where are your notes saved? Then make the neccessary changes. 

## Structure
---
### Repositories 
> Collection of code repos 
- Script to clone repos into specific folders to organise my codebases. 
- Currently, all the repos I reference are on GitHub.com, if you use GitHub enterprise, GitLab etc then adjust the script to suit.

### Notes (Second Brain)
> Collection of my markdown files
- Backed up on GitHub in a private repo.
- Simply, cloning the repo into `~/notes`

### Temp 
> Space for storing short-lived notes, logs, attachments 
- Not backed up on GitHub as these are not files which I intend to sync. 
- Simply, creating a directory at `~/temp` 
