


#alias 3906hosts='for a in {1..254}; do ans="`dig -x 10.39.6.$a @10.39.6.254 +short +norecurse`"; if [ $ans ]; then echo -e "10.39.6.$a\t$ans";else echo -e "10.39.6.$a\t__"; unset ans; unset a; fi; done'
alias 3906hosts='for a in {254..1}; do ans="`dig -x 10.39.6.$a @10.39.6.254 +short +norecurse`"; if [ $ans ]; then echo -e "10.39.6.$a\t$ans";else echo -e "10.39.6.$a\t__"; unset ans; unset a; fi; done'

# I wish this worked ... it pulls the time when the alias is created (when the shell is strted) but doesn't re-check the time each time the alias is run.
alias announce="(say \'its `date +%I | sed -e 's/^0\(.\)/\1/'` `date +%M` o'clock\')"


alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"
#alias tree='ls -R | grep :$ | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'

alias ll="ls -alh"

alias check-ds='for h in smc-ds-73 fcnf-ds-73 sdbn1-ds-73 sdbn2-ds-73 sdbn3-ds-73; do figlet $h; ssh root@$h '\''systemctl status | grep State: | head -1; for i in smc-ds-73 fcnf-ds-73 sdbn1-ds-73 sdbn2-ds-73 sdbn3-ds-73; do ping -c 2 $i | grep bytes ; done'\''; done'

# Various SSH shortcuts
alias azure="ssh -i ~/.ssh/jamegill-azure-2020.pem -l jamegill "
alias dev='ssh -i "~/.ssh/jamegill.LightsailDefaultKey-us-east-1.pem" -l bitnami ghost-1.thirtynineohsix.com'
alias ec2='ssh -i "~/.ssh/jamegill_aws_vpc001.pem" -l ec2-user '
alias kb-aws='ssh -i "~/.ssh/KBellaevents-AWS-DefaultVPC-KeyPair202111.pem" -l ec2-user '
alias kb-ls='ssh -i "~/.ssh/KBellaevents-AWS-DefaultVPC-KeyPair202111.pem" -l bitnami'
#alias kb-aws='ssh -i "~/.ssh/KBellaevents-AWS-DefaultVPC-KeyPair202111.pem" -l ubuntu '
alias kb-aws-wp='ssh -i ".ssh/KBellaevents-AWS-DefaultVPC-KeyPair202111.pem" bitnami@ec2-52-91-59-168.compute-1.amazonaws.com'
alias lightsail='ssh -i "~/.ssh/jamegill.LightsailDefaultKey-us-east-1.pem" -l bitnami '
#alias frenchdoor='ssh -i "~/.ssh/KBELLA-LightsailDefaultKeyPair-us-east-1.pem" bitnami@3.221.129.130'
alias frenchdoor="kb-aws frenchdoorevents.com"

alias plus='ssh -i "~/.ssh/jamegill_aws_vpc001.pem" -l ec2-user 10.39.1.10 '


# Type "nvm" to load Node Version Manager, see HTTP://nvm.sh
# doing it this way avoids sourcing 4123 lines every invocation
# This sets the NVM directory
# .. then loads nvm the Node.js version manager
# .. then loads nvm bash_completion
alias nvm='
unalias nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
echo "nvm loaded." '


## Prompt stuff I pretty much blindly copied from:
#### https://scriptingosx.com/2019/07/moving-to-zsh-06-customizing-the-zsh-prompt/
# This creates
#	- a green username if the previous command's output was success
#	- a red output of the exit code if the previous command failed
# 	- the current directory up to 2 levels deep or ~ in a muted grey color
#	- a zsh-standard % prompt finial
#	- BONUS right-side prompt with the current HH:MM:SS in grey but red on failure
#PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b %# '
PS1='%(?.%F{green}%n.%F{red}?%?)%f %B%F{240}%2~%f%b %# '
#RPROMPT='%F{240}%*%f'
RPROMPT='%(?.%F{240}%*.%F{red}%K{white}%*)%f%k'


