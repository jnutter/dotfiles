export CVS_RSH=ssh
export PATH=/usr/local/bin:/AIRSDK/bin:/usr/local/mysql/bin:/opt/subversion/bin:$PATH
export set SVN_EDITOR=vim

source ~/.git-completion.bash

test -r /sw/bin/init.sh && . /sw/bin/init.sh

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

# {{{
# Node Completion - Auto-generated, do not touch.
shopt -s progcomp
for f in $(command ls ~/.node-completion); do
  f="$HOME/.node-completion/$f"
  test -f "$f" && . "$f"
done
# }}}
