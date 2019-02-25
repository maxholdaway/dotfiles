
# Export
export ZSH="${HOME}/.oh-my-zsh"
export GOPATH="${HOME}/Workspace/Go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:$HOME/bin:${GOPATH}/bin:${GOROOT}/bin"

# Aws fuzzy
export AWS_FUZZ_USER="ec2-user"
export AWS_FUZZ_PATH=~/.ssh/your_private_key
export AWS_FUZZ_PRIVATE_IP=true

# K8s
export KUBECONFIG=$HOME/.kube/config:/tmp/k8confs/maxholdaway_staging_k8clus

# NVM
export NVM_DIR=$HOME/.nvm
source $(brew --prefix nvm)/nvm.sh


# Aliases

# All commands are prefixed with space -> do not store in history
alias l=' ls -alh'

# K8s
kubetoken() {
  kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep eks-admin | awk '{print $1}')
}
kubedashboard() {
  open -a 'Google Chrome' 'http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:https/proxy/'
}

# Git
alias gs=" git status"
alias gr=" git remote -v"
alias gl=" git log --graph"
alias gp=" git log --stat --max-count=1 --format=medium"
alias gd=" git diff"
alias gds=" git diff --staged"

# Ignore from history
alias exit=" exit"

# Zsh shortcut
zshconfig() {
  code ~/.zshrc
}


# Serverless
[[ -f /Users/maxholdaway/.nvm/versions/node/v11.4.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/maxholdaway/.nvm/versions/node/v11.4.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
[[ -f /Users/maxholdaway/.nvm/versions/node/v11.4.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/maxholdaway/.nvm/versions/node/v11.4.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
[[ -f /Users/maxholdaway/.nvm/versions/node/v11.4.0/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/maxholdaway/.nvm/versions/node/v11.4.0/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh


# History
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# Allow multiple terminal sessions to all append to one zsh command history
setopt append_history
# Save timestamp and duration
setopt extended_history
# Adds commands as they are typed, don't wait until shell exit
setopt inc_append_history
# When trimming history, remove oldest duplicates first
setopt hist_expire_dups_first
# Do not write events to history that are duplicates of previous events
setopt hist_ignore_all_dups
# Remove line from history when first character is a space
setopt hist_ignore_space
# When searching history, don't display already cycled results twice
setopt hist_reduce_blanks
# Don't execute, just expand history
setopt hist_verify
# Import new comands and appends typed commands to history
setopt share_history


# Extensions
ZSH_THEME="powerlevel9k/powerlevel9k"

plugins=(
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-completions
)

# Powerlevel 9k
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_CUSTOM_NAME_BACKGROUND="lime"
POWERLEVEL9K_CUSTOM_SHRINK_PATH_BACKGROUND="blue"
POWERLEVEL9K_CUSTOM_SHRINK_PATH_FOREGROUND="black"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(aws dir vcs)


# Activate
autoload -U compinit && compinit
source $ZSH/oh-my-zsh.sh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh


