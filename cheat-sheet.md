> $ git clone https://github.com/jg3/UbuntuUpdates
Make a copy of a git repo on the local system

To add a new file to a git repository ...
- clone the repo to a local directory
- copy the file into the local repo
- add the file to the local staging area
- commit the change(s)
- push the changes up to the remote repository

"origin" is the main remote repository
"remote" just means a not-local repository

> $ git status
Check if you have changes to be committed or commits to be pushed. Do it a lot.

> $ git pull
Synchronize the local repository with the remote, particularly when starting
to work on a project, or before pushing up changes to a project

> $ git add <fiile>
> $ git add .
Adds the file (or all, recursively) to the local repo and stages for commit.

> $git reset HEAD YOUR-FILE
To un-stage a file, undo changes made locally.

> $ git commit -m "comment about what you are doing"
Commits the tracked changes and prepares them to be pushed to a remote repository.
To remove this commit and modify the file, use 'git reset --soft HEAD~1' and commit and add the file again.


> $ git push origin your-branch
Pushes the changes in your local repository up to the remote repository you specified as the origin

-----
## Branches!
concepts: https://git-scm.com/about
commands: https://git-scm.com/docs/git-branch

> $ git branch newbranch
create a new branch to work in

> $ git switch newbranch
start working in your new branch

More:
> $ git branch --delete
> $ git branch --verbose
> $ git branch --list
> $ git branch --show-current
