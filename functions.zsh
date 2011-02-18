# @author     Sebastian Tramp <mail@sebastian.tramp.name>
# @license    http://opensource.org/licenses/gpl-license.php
#
# functions and key bindings to that functions
#

# strg+x,s adds sudo to the line
# Zsh Buch p.159 - http://zshbuch.org/
run-with-sudo() { LBUFFER="sudo $LBUFFER" }
zle -N run-with-sudo
bindkey '^Xs' run-with-sudo

# Top ten memory hogs
# http://www.commandlinefu.com/commands/view/7139/top-ten-memory-hogs
memtop() {ps -eorss,args | sort -nr | pr -TW$COLUMNS | head}
zle -N memtop

tmuxhglog() {
	tmux kill-pane -t 1
	tmux split-window -h -l 40 "while true; do clear; date; echo; hg xlog-small -l 5 || exit; sleep 600; done;"
	tmux select-pane -t 0
}

# Escape potential tarbombs
# http://www.commandlinefu.com/commands/view/6824/escape-potential-tarbombs
etb() {
	l=$(tar tf $1);
	if [ $(echo "$l" | wc -l) -eq $(echo "$l" | grep $(echo "$l" | head -n1) | wc -l) ];
	then tar xf $1;
	else mkdir ${1%.t(ar.gz||ar.bz2||gz||bz||ar)} && tar xvf $1 -C ${1%.t(ar.gz||ar.bz2||gz||bz||ar)};
	fi ;
}

# http://www.commandlinefu.com/commands/view/4792/a-function-to-find-the-newest-file-in-a-directory
newest () { find ${1:-\.} -type f |xargs ls -lrt ; }

# http://www.commandlinefu.com/commands/view/7294/backup-a-file-with-a-date-time-stamp
buf () {
    oldname=$1;
    if [ "$oldname" != "" ]; then
        datepart=$(date +%Y-%m-%d);
        firstpart=`echo $oldname | cut -d "." -f 1`;
        newname=`echo $oldname | sed s/$firstpart/$firstpart.$datepart/`;
        cp ${oldname} ${newname};
    fi
}

atomtitles () { curl --silent $1 | xmlstarlet sel -N atom="http://www.w3.org/2005/Atom" -t -m /atom:feed/atom:entry -v atom:title -n}


function printHookFunctions () {
    print -C 1 ":::pwd_functions:" $chpwd_functions
    print -C 1 ":::periodic_functions:" $periodic_functions
    print -C 1 ":::precmd_functions:" $precmd_functions
    print -C 1 ":::preexec_functions:" $preexec_functions
    print -C 1 ":::zshaddhistory_functions:" $zshaddhistory_functions
    print -C 1 ":::zshexit_functions:" $zshexit_functions
}

# reloads all functions
# http://www.zsh.org/mla/users/2002/msg00232.html
r() {
    local f
    f=(~/.zsh/functions.d/*(.))
    unfunction $f:t 2> /dev/null
    autoload -U $f:t
}

# activates zmv
autoload zmv
# noglob so you don't need to quote the arguments of zmv
# mmv *.JPG *.jpg
alias mmv='noglob zmv -W'

# start a webcam for screencast
function webcam () {
    mplayer -cache 128 -tv driver=v4l2:width=350:height=350 -vo xv tv:// -noborder -geometry "+1340+445" -ontop -quiet 2>/dev/null >/dev/null
}

# Rename files in a directory in an edited list fashion
# http://www.commandlinefu.com/commands/view/7818/
function massmove () {
    ls > ls; paste ls ls > ren; vi ren; sed 's/^/mv /' ren|bash; rm ren ls
}


# Put a console clock in top right corner
# http://www.commandlinefu.com/commands/view/7916/
function clock () {
    while sleep 1;
    do
        tput sc
        tput cup 0 $(($(tput cols)-29))
        date
        tput rc
    done &
}
