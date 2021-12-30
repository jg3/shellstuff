# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin
export PATH

# set a teal-colored prompt
PS1="\[\033[36m\][\$(date +%H:%M:%S)][\u@\h:\w]$\[\033[0m\] "

# if this is NOT a screen, tell me what screens are running.
case "$TERM" in
        screen*)
        ;;
                *)
        echo -n "Screens: " && screen -Q windows && echo
        ;;
            esac
