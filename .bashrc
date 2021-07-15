# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
alias em='sudo emerge'
alias ems='sudo emerge -s'
alias emc='sudo emerge -c'
alias emw='sudo emerge -uUDN @world'
alias tm='sudo ntpdate ntp.ntsc.ac.cn && hwclock --systohc'
alias ra='ranger'
alias cdf='cd $(find * -type d | fzf)'
alias nvimf='nvim $(fzf)'
alias cdgf='git checkout $(git branch -r | fzf)'
alias l='ls -al'
alias battery='upower -i `upower -e | grep ‘BAT’`$ upower -i `upower -e | grep 'BAT'`'
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


# Put your fun stuff here.
