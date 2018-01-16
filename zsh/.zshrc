ZSH=$HOME/.oh-my-zsh

ZSH_THEME="paulloz"

COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(zsh-syntax-highlighting archlinux autojump battery bower cabal catimg coffee cp cpanm django encode64 fabric git git-extras git git-extras gitfast github gitignore heroku history history-substring-search jsontools jump node npm nyan perl pip python screen sprunge sublime svn svn-fast-info systemd urltools virtualenv)

source $ZSH/oh-my-zsh.sh

source $HOME/.myzshrc
