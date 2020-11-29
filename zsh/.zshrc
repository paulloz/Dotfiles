# Path to oh-my-zsh
export ZSH="/home/paulloz/.oh-my-zsh"

# Theme
ZSH_THEME="paulloz"

# Plugins
plugins=(archlinux colored-man-pages encode64 git man nmap pj sprunge sudo tmux vscode zsh-autosuggestions)

# Completion
COMPLETION_WAITING_DOTS="true"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=1

# Tmux
ZSH_TMUX_UNICODE="true"

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Navigation
PROJECT_PATHS=(~/Documents)

# Aliases
alias cat="bat"
alias mkdir="mkdir -p"
alias grep="grep -n --color"

# Editors
EDITOR=vim
if command -v nvim &>/dev/null;
then
	alias vim="nvim"
fi

# WSL shenanigans
if [[ "$(< /proc/sys/kernel/osrelease)" == *microsoft* ]]; then
	export LIBGL_ALWAYS_INDIRECT=1
	export WSL_HOST=$(awk '/^nameserver / {print 2}' < /etc/resolv.conf)
	export DISPLAY=$WSL_HOST:0
fi
