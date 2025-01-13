

# Keep aliases organized in another file, ~/.aliases -> ~/shellstuff/.aliases
source .aliases


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

### Ruby/Jekyll stuff
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh
chruby ruby-3.3.5 # run chruby to see actual version

## SSH-agent stuff
# 1)
# This makes the ssh-agent shared across all shells (that run this file**)
# which means you only have to unlock a key once.
# ** see: https://jdhao.github.io/post/zsh_startup_file/
# see: https://superuser.com/a/141233/126639
check-ssh-agent() {
    [ -S "$SSH_AUTH_SOCK" ] && { ssh-add -l >& /dev/null || [ $? -ne 2 ]; }
}
check-ssh-agent || export SSH_AUTH_SOCK=~/.tmp/ssh-agent.sock
check-ssh-agent || eval "$(ssh-agent -s -a ~/.tmp/ssh-agent.sock)" > /dev/null
# 2)
# this counts the keys and aliases adding some if there are none.
if ( ssh-add -l &> /dev/null )
then
  for k in `ssh-add -l | wc -l`
  do
    echo "The ssh-agent has ${k} identites added. Use 'ssh-add -l' to list."
  done
else
  echo "The ssh-agent has no identittes. Use 'keys-please' to ssh-add some."
  # this will add all the keys named with *.key
  alias keys-please='for f in ~/.ssh/*.key; do ssh-add ${f}; done'
fi
# 3)
# /usr/local/bin/ssh-ident || https://github.com/ccontavalli/ssh-ident
# is probably better, but doesn't apply to the gcloud ssh alias (does it?)

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


# the following is for `compdef`, a package that enables autocompletions (see op below)
# see: https://unix.stackexchange.com/questions/339954/zsh-command-not-found-compinstall-compinit-compdef
autoload -Uz compinit
compinit -i

# 1password (`op`) shell completion
# see:  https://developer.1password.com/docs/cli/get-started/
eval "$(op completion zsh)"; compdef _op op
# 1password plugin for github credentials
if [ -f '/Users/jamegill/.config/op/plugins.sh' ]; then source /Users/jamegill/.config/op/plugins.sh

# iTerm2 shell integration stuff
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

# iTerm2 badge alias
# usage: badge foo
function badge() {
  printf "\033]1337;SetBadgeFormat=%s\a" $(echo -n $1 | base64)
}
function badge_prompt() {
  osascript -e 'text returned of (display dialog "You could just set the badge with `badge <whatever>`" default answer "set your badge title, genius")' 2>/dev/null
}
function badgep() {
  badge_prompt `badge`
}


# zsh option to show a command pulled from history before executing it
# from https://zsh.sourceforge.io/Guide/zshguide02.html#l16
# to explore: https://zsh.sourceforge.io/Guide/zshguide02.html#l18
# reminder:  use ctrl-r to search history
setopt HIST_VERIFY

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jamegill/Applications/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jamegill/Applications/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jamegill/Applications/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jamegill/Applications/google-cloud-sdk/completion.zsh.inc'; fi

# The next line enable autocompletion for kubectl
if [ -f '/usr/local/bin/kubectl' ]; then source <(kubectl completion zsh); fi

# Tab completion for `terraform` command
#terraform -install-autocomplete
complete -o nospace -C /usr/local/bin/terraform terraform
# can be un-done with terraform -uninstall-autocomplete

# this loads Bash-type tab-completion into zsh
autoload -U +X bashcompinit && bashcompinit

# Tab completion for `aws` command
complete -C '/usr/local/bin/aws_completer' aws
