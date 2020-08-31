PS1="%F{magenta}╭─[%f%~%F{magenta}]
╰─ %f"

PS2="%F{magenta} … %f"

RPS1='$(rps1)'

ZSH_THEME_GIT_PROMPT_DIRTY="%F{yellow}%B汚い%b%f"
ZSH_THEME_GIT_PROMPT_CLEAN=""

rps1() {
    if [ -n "$(git_repo_name)" ]; then
        echo -n "$(parse_git_dirty)"
        echo "%F{magenta}[%f$(git_prompt_short_sha)%F{magenta}@%f$(current_branch)%F{magenta}]%f"
    fi
}

