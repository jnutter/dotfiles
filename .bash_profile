export PATH=/usr/local/bin:$PATH
export TERM='xterm-256color'
export EDITOR=`which vim

# Git branch competion
if [ -f ~/git-completion.bash ]; then
  source ~/git-completion.bash
fi

export DOTBASH=~/.bash
source $DOTBASH/main.sh
export PS1="\u \W\[$txtcyn\]\$git_branch\[$txtrst\]\$ "

function pr () {
        local repo=`git remote -v | grep -m 1 "(push)" | sed -e "s/.*github.com[:/]\(.*\)\.git.*/\1/"`
        local branch=`git name-rev --name-only HEAD`
        if [ "$1" != "" ]; then
                local branch=$1
        fi
        echo "... creating pull request for branch \"$branch\" in \"$repo\""
        open https://github.com/$repo/pull/new/$branch
}

export -f pr

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh
