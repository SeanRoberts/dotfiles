# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.zsh_custom

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="excid3"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rvm osx history-substring-search docker)
alias rake='noglob rake'
source $ZSH/oh-my-zsh.sh
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

precmd() {
  export DIR=`basename $PWD`
  echo -ne "\e]1;$DIR\a"
}
. ~/.zsh_scripts/aliases
. ~/.zsh_scripts/iterm2.zsh
. ~/.zsh_scripts/z.sh
. ~/.zsh_scripts/ssh_completion.sh
# Customize to your needs...
export PATH=~/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/git/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/heroku/bin

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

# Substring searching
for keycode in '[' '0'; do
  bindkey "^[${keycode}A" history-substring-search-up
  bindkey "^[${keycode}B" history-substring-search-down
done
unset keycode
unsetopt AUTO_CD

# NVM
export NVM_DIR="$HOME/.nvm"
. "$(brew --prefix nvm)/nvm.sh"

# Syntax highlighting
source ~/.zsh_custom/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
. `brew --prefix`/etc/profile.d/z.sh

# known_hosts completion
local knownhosts
knownhosts=( ${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[0-9]*}%%\ *}%%,*} )
zstyle ':completion:*:(ssh|scp|sftp|ping):*' hosts $knownhosts


function t() {
  tree -I '.git|node_modules|bower_components|.DS_Store' --dirsfirst --filelimit 15 -L ${1:-3} -aC $2
}

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PATH=./bin:$PATH
export PATH=/Users/seanroberts/Qt5.5.1/5.5/clang_64/bin:$PATH

export PATH="$HOME/.yarn/bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/seanroberts/.nvm/versions/node/v6.8.1/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/seanroberts/.nvm/versions/node/v6.8.1/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/seanroberts/.nvm/versions/node/v6.8.1/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/seanroberts/.nvm/versions/node/v6.8.1/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh

if [ $commands[kubectl] ]; then
  source <(kubectl completion zsh)
fi
