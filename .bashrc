# func to grab the venv name when activating a venv
function virtualenv_info(){
    # Get Virtual Env
    if [[ -n "$VIRTUAL_ENV" ]]; then
        # ToDo: get the actual venv name
        venv="[ venv ]"
    else
        # In case you don't have one activated, don't mess up the PS1
        venv=''
    fi
    [[ -n "$venv" ]] && echo "(venv:$venv) "
}

# disable the default virtualenv prompt change
export VIRTUAL_ENV_DISABLE_PROMPT=1

VENV="\$(virtualenv_info)"

# Custom Prompt with dir, venv, and git info
# https://bashrcgenerator.com/
PS1='\[\033]0;\w\007\]\n\[\033[38;5;76m\][\!] [\D{%m/%d} \A]\[\033[0;32m\] [\u@\h] ${VENV} \[\033[38;5;39m\][\w\]]\033[0;36m\]`__git_ps1`\[\033[0m\]\n\[\033[1;30m\]$ \[\033[0m\]'
unset color_prompt force_color_prompt

# Git aliases and funcs
alias gs="git status"
alias ga="git add -A"
alias gap="ga -p"
alias gc="git commit"
alias gcm="gc -m"
alias gl="git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(bold cyan) %an  %C(dim green)(%ar)%n        %C(white)%s%n%C(dim yellow)%d%C(reset)' --all"
alias gls="gl --simplify-by-decoration"
alias gd="git diff"
alias gdc="git diff --cached"
alias gdma='gd master...@'
alias gundo="git reset @^"
alias gfm="git fetch && gfo master"
alias gfmc="gfm && git checkout master"
alias gup="git push"
alias gnb="git checkout -b"
alias gco="git checkout"

function gfo () {
        git fetch . origin/$1:$1
}

function gpsu () {
    branch=$(git rev-parse --abbrev-ref @)
    cmd="git push -u origin $branch:users/selta/$branch"
    echo $cmd
    eval $cmd
}