#!/bin/bash

# here's the gist, if you want to do it manually:

# ln -s shellstuff/.ssh .ssh
# ln -s shellstuff/.git .git
# ln -s shellstuff/.gitconfig .gitconfig
# ln -s shellstuff/.gitignore .gitignore
# ln -s shellstuff/.screenrc .screenrc
# ln -s shellstuff/.vimrc .vimrc
# ln -s shellstuff/.zshrc .zshrc
# chmod -R 0600 ~/.ssh

# list file (and directory) names *without the leading dot* here:
DOTFILES="ssh, git, gitconfig, gitignore, screenrc, vimrc, zshrc"

# -- don't change anything below this line --

DATE=`date "+%Y%m%d%__%H%M%S"`

# if you are not doing this in ~/shellstuff/ you should be.
# might make this more flexible in the future. or not.
if [ $HOME/shellstuff != $PWD ]
then
	echo "Please move this whole directory to ~/shellstuff and try again."
	exit 1
else
	echo "confirmed we are running from ~/shellstuff ... proceeding."
fi

for f in [ $DOTFILES ]
do
	# check to see if the file exists already
	if [ -f "~/.$f" ]
		echo -n "Backing up: "
		do cp -v ~/.$f ~/.$f.old.{$DATE}
	fi
	ln -v -s ~/shellstuff/.$f ~/

###
#  chmod -R 0600 ~/.ssh
###
# Desired permission standard
STANDARD="600"  

# Check actual config file permission  
ACTUAL=$(stat -c %a ~/.ssh/config)

if [ "$ACTUAL" -ne "$STANDARD" ]; then
  # Reapply permission standard
  chmod 600 ~/.ssh/config  
fi

echo " -- $1 complete. -- "
