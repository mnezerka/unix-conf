# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
    xterm-256color) color_prompt=yes;;
esac

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
if [ "$color_prompt" = yes ]; then
    #PS1='\[\033[00;32m\]\u@\h\[\033[00;36m\] \w\[\033[00;32m\]$(__git_ps1)\[\033[00m\] \$\[\033[00m\] '
    PS1='\[\033[38;5;242m\]\u@\h\[\033[38;5;32m\]$(__git_ps1) \[\033[38;5;227m\]\w\[\033[00m\] \$\[\033[00m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

export PATH=$PATH:~/conf/bin
