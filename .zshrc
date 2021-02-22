



# I wish this worked ... it pulls the time when the alias is created (when the shell is strted) but doesn't re-check the time each time the alias is run.
alias announce="(say \'its `date +%I | sed -e 's/^0\(.\)/\1/'` `date +%M` o'clock\')"


alias 3906hosts='for a in {1..254}; do ans="`dig -x 10.39.6.$a @10.39.6.254 +short +norecurse`"; if [ $ans ]; then echo -e "10.39.6.$a\t$ans";else echo -e "10.39.6.$a\t__"; unset ans; unset a; fi; done'

alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"

alias ll="ls -alh"

alias ec2="ssh -i \"~/.ssh/jamegill_aws_vpc001.pem\" -l ec2-user "
alias azure="ssh -i ~/.ssh/jamegill-azure-2020.pem jamegill@23.96.60.158"


# This loads nvm
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
# This loads nvm bash_completion
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  


## Prompt stuff I pretty much blindly copied from:
#### https://scriptingosx.com/2019/07/moving-to-zsh-06-customizing-the-zsh-prompt/
# This creates
#	- a green username if the previous command's output was success
#	- a red output of the exit code if the previous command failed
# 	- the current directory up to 5 levels deep or ~ in a muted grey color
#	- a zsh-standard % prompt finial
#	- BONUS right-side prompt with the current HH:MM:SS in grey but red on failure
#PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b %# '
PROMPT='%(?.%F{green}%n.%F{red}?%?)%f %B%F{240}%5~%f%b %# '
#RPROMPT='%F{240}%*%f'
#RPROMPT='%(?.%F{240}%*.%F{red}%*)%f'
RPROMPT='%(?.%F{240}%*.%F{red}%K{white}%*)%f%k'
