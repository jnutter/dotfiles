export PATH=/usr/local/bin:$PATH
export TERM='xterm-256color'
export EDITOR=`which vim`

# Git branch competion
if [ -f ~/git-completion.bash ]; then
  source ~/git-completion.bash
fi

source ~/.aliases

export DOTBASH=~/.bash
source $DOTBASH/main.sh
export PS1="\u \W\[$txtcyn\]\$git_branch\[$txtrst\]\$ "

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh
