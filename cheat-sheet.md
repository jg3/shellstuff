# My git cheat-sheet
*There are many like it, but this one is mine!*

Make a copy of a git repo on the local system
> % git clone https://github.com/jg3/shellstuff


### To add a new file to a git repository ...
- clone the repo to a local directory
- copy the file into the local repo
- add the file to the local staging area
- commit the change(s)
- push the changes up to the remote repository

"origin" is the main remote repository.

"remote" just means a not-local repository.


Check status if you have changes to be committed or commits to be pushed. Do it a lot:
> % git status

Synchronize the local repository with the remote, particularly when starting to work on a project, or before pushing up changes to a project:
> % git pull

Adds the file (or all, recursively) to the local repo and stages for commit:
> % git add filename
> % git add .

To un-stage a file:
> %git reset HEAD filename

to un-do changes made locally:
> % git restore filename

Commit the tracked changes and prepares them to be pushed to a remote repository.
> % git commit -m "comment about what you are doing"

Pushes the changes in your local repository up to the remote repository you specified as the origin:
> % git push origin your-branch


-----
## Branches!
concepts: https://git-scm.com/about

commands: https://git-scm.com/docs/git-branch

create a new branch to work in
> % git branch newbranch

start working in your new branch
> % git switch newbranch

More:
> % git branch --delete
>
> % git branch --verbose
>
> % git branch --list
>
> % git branch --show-current
