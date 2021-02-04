To clone a git repo to local ...
$ git clone https://github.com/jg3/UbuntuUpdates


To add a file to a git repository ...
- clone the repo to local
- copy the file into the local repo directory

> $ git add .
Adds the file to your local repository and stages it for commit. To unstage a file, use 'git reset HEAD YOUR-FILE'.

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
