PS1='%F{magenta}╭─$(ps1_host)[%f%~%F{magenta}] %(1j.✦.)
╰─ %f'

PS2="%F{magenta} … %f"

RPS1='$(rps1)'

ZSH_THEME_GIT_PROMPT_DIRTY="%F{yellow}%B汚い%b%f"
ZSH_THEME_GIT_PROMPT_CLEAN=""

ps1_host() {
    if [[ -v SSH_TTY ]]; then
        echo "[%F{yellow}%n%F{magenta}@%F{yellow}%m%F{magenta}]-"
    fi
}

rps1() {
    if [ -n "$(git_repo_name)" ]; then
        echo -n "$(parse_git_dirty)"
        git rev-parse --abbrev-ref --symbolic-full-name @{u} &> /dev/null
        if [ $? -eq 0 ]; then
            GCA=$(git_commits_ahead 2> /dev/null)
            if [ -z $GCA ]; then GCA="0%B↑" else GCA="$GCA%B%F{red}↑%f" fi
            GCB=$(git_commits_behind 2> /dev/null)
            if [ -z $GCB ]; then GCB="↓%b0" else GCB="%F{red}↓%b%f$GCB" fi
            echo -n "%F{magenta}[%f$GCA$GCB%F{magenta}]-%f"
        fi
        echo "%F{magenta}[%f$(git_prompt_short_sha)%F{magenta}@%f$(current_branch)%F{magenta}]%f"
    fi
}

