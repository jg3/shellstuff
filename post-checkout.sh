#!/bin/bash

# Just some setup steps.  Assumes you decrypted & extracted the ssh_stuff.age file

# Here's the gist, if you want to do it manually:

# ln -s shellstuff/.ssh .ssh
# ln -s shellstuff/.git .git
# ln -s shellstuff/.gitconfig .gitconfig
# ln -s shellstuff/.gitignore .gitignore
# ln -s shellstuff/.screenrc .screenrc
# ln -s shellstuff/.vimrc .vimrc
# ln -s shellstuff/.zshrc .zshrc

# chmod -R 0600 ~/.ssh/
# chmod 0700 ~/.ssh
# chmod -R 0644 ~/.ssh/*.pub

# List file (and directory) names *without the leading dot* here:
DOTFILES="ssh git gitconfig gitignore screenrc vimrc zshrc"

# -- Don't change anything below this line --

DATE=$(date "+%Y%m%d__%H%M%S")

# Ensure we are running from ~/shellstuff
if [[ $HOME/shellstuff != $PWD ]]; then
    echo "Please move this whole directory to ~/shellstuff and try again."
    exit 1
else
    echo "Confirmed we are running from ~/shellstuff ... proceeding."
fi

for f in $DOTFILES; do
    # Check to see if the file exists already
    if [ -f "$HOME/.$f" ]; then
        echo "Backing up: $HOME/.$f"
        cp -v "$HOME/.$f" "$HOME/.$f.old.$DATE"
    fi

    # Create symbolic link
    ln -v -s "$HOME/shellstuff/.$f" "$HOME/"
done

# Set permissions for ~/.ssh directory and its contents
if [ -d "$HOME/.ssh" ]; then
    echo "Setting permissions for ~/.ssh and its contents..."

    # Set recursive permissions for all files in ~/.ssh to 0600
    chmod -R 0600 "$HOME/.ssh"

    # Set permissions for the ~/.ssh directory itself to 0700
    chmod 0700 "$HOME/.ssh"

    # Set recursive permissions for all .pub files in ~/.ssh to 0644
    find "$HOME/.ssh" -type f -name "*.pub" -exec chmod 0644 {} \;

    echo "Permissions for ~/.ssh have been updated."
else
    echo "Directory ~/.ssh does not exist. Skipping permission updates."
fi

echo " -- Script complete. -- "

