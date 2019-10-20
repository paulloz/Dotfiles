ZSH=$HOME/.oh-my-zsh
ZSH_THEME="paulloz"
COMPLETION_WAITING_DOTS="true"

plugins=(autojump battery cabal catimg colored-man-pages cp cpanm debian django encode64 git git-extras git gitfast github gitignore history history-substring-search jump node npm perl pip pj python screen sprunge svn svn-fast-info systemd urltools thefuck tmux virtualenv zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# plugin:pj
export PROJECT_PATHS=($HOME/Documents)

# plugin:zsh-autosuggestions
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=0"
export ZSH_AUTOSUGGEST_STRATEGY="default"

# History
export   HISTFILE=~/.history
export   HISTSIZE=1000
export   SAVEHIST=1000
unsetopt SHARE_HISTORY
setopt   HIST_IGNORE_DUPS
setopt	 HIST_EXPIRE_DUPS_FIRST
setopt	 HIST_REDUCE_BLANKS

# Correction
unsetopt CORRECT
unsetopt CORRECTALL

# Ls
export LS_COLORS="di=00;35:ex=1;35:ln=3;35"
alias  ls='ls --color=always --group-directories-first'
alias  l='ls'
alias  ll='l -lhF'
alias  la='l -A'
alias  lla='ll -A'

# Some keyboard special bindings
bindkey "^[[3~"    delete-char
bindkey "^[3;5~"   delete-char
bindkey '^[[1~' beginning-of-line
bindkey '^[[H' beginning-of-line
bindkey '^[OH' beginning-of-line
bindkey '^[[7~' beginning-of-line
bindkey "^A" beginning-of-line
bindkey '^[[4~' end-of-line
bindkey '^[[F' end-of-line
bindkey '^[OF' end-of-line
bindkey '^[[8~' end-of-line
bindkey '^E' end-of-line
bindkey "^F" history-incremental-search-forward
bindkey "^R" history-incremental-search-backward

# Moving around
setopt   AUTO_PUSHD
unsetopt AUTO_CD
alias dirs='dirs -v'
alias gitroot='cd `git rev-parse --show-toplevel`'

# Paths
export PYTHONPATH=$PYTHONPATH:./.pip
export PATH=$PATH:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/sbin:/usr/local/bin:$HOME/.cabal/bin

# GPG
export GPG_TTY=$(tty)

# Misc
if command -v nvim &>/dev/null;
then
    export EDITOR=nvim
    alias vim='nvim'
else
    export EDITOR=vim
fi
export TERM='xterm'
alias mkdir='mkdir -p'
alias grep='grep -n --color'

export VIRTUAL_ENV_DISABLE_PROMPT=1

if [ -f $HOME/.profile ] ; then
	source $HOME/.profile
fi
