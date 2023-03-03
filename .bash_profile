# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# just to be sure
alias ll='ls -al'

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin
export PATH

# set a teal colored prompt
#PS1="\[\033[36m\][\$(date +%H:%M:%S)][\u@\h:\w]$\[\033[0m\] "
# set a sky blue prompt
PS1='\[\e[0;38;5;39m\][\d \D{}] \u@\h:\w \$ \[\e[0m\]'
# set a bright yellow prompt
#PS1='\[\e[0;93m\][\d \D{}] \u@\h:\w \$ \[\e[0m\]'
# set a kinder pink prompt
#PS1='\[\e[0;38;5;218m\][\d \D{}] \u@\h:\w \$ \[\e[0m\]'


if command -v figlet  &> /dev/null
then
    figlet `hostnamectl hostname`
else
    echo "figlet could not be found. Try 'sudo apt install figlet' for banners."
fi

# if this is NOT a screen, tell me what screens are running.
case "$TERM" in
        screen*)
        ;;
              *)
        echo -n "Screens: " && screen -Q windows && echo
        ;;
            esac
