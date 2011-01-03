# enable hook method
autoload add-zsh-hook

# enable and configure vcs_info
autoload -Uz vcs_info
add-zsh-hook precmd vcs_info
zstyle ':vcs_info:*' enable hg git cvs svn
zstyle ':vcs_info:*' formats '%s|%b|%a|%i|%R|%r|%S|%m'

# my prompt theme
function promptSetup () {
    setopt prompt_subst
    local TERMWIDTH
    (( TERMWIDTH = ${COLUMNS} - 1 ))

    NOCOLOR="%{$terminfo[sgr0]%}"
    PS1=''; RPS1=''
    PS2="↷ %_>"; RPS2=''
    PS3="↷ ?#"; RPS3=''
    PS4="↷ +i>"; RPS3=''

    # prepare vcs info
    VCS_LINE=''
    VCS=$vcs_info_msg_0_
    VCS_TYPE=$VCS[(ws:|:)1]
    VCS_BRANCH=$VCS[(ws:|:)2]
    VCS_CHANGES=''

    # setup the prompt sign
    if [[ $VCS_TYPE != '' ]]; then
        VCS_LINE+=$NOCOLOR
        VCS_LINE+='➜ '
        case $VCS_TYPE in
            'hg')
                VCS_LINE+='☿ '
                VCS_CHANGES=`hg st 2>/dev/null | wc -l`
                ;;
            'git')
                VCS_LINE+='± '
                ;;
            *)
                VCS_LINE+="$VCS_TYPE "
                ;;
        esac
    fi

    VCS_LINE+=$VCS_BRANCH

    if [[ $VCS_CHANGES > 0 ]]; then
        VCS_LINE+="%F{yellow}%B"
        VCS_LINE+=' ★ '
        VCS_LINE+=$VCS_CHANGES
    fi

    # rootshell gets another prompt sign
    PR_SIGN=$NOCOLOR
    PR_SIGN+="%F{red}%B"
    PR_SIGN+=%(#."☠".'☭')
    PR_SIGN+="%F{white}%b"

    # http://unix.stackexchange.com/questions/1022/is-it-possible-to-display-stuff-below-the-prompt-at-a-prompt
    terminfo_down_sc=$terminfo[cud1]$terminfo[cuu1]$terminfo[sc]$terminfo[cud1]

    # Finally, the prompt.
    PS1=$'\n'                     # newline (specially quotet, see zsh FAQ 3.13)
    PS1+="%{$terminfo_down_sc$VCS_LINE$terminfo[rc]%}" # the second line
    PS1+=$PR_STITLE               # tmux title if present
    PS1+=$PR_VCSSIGN              # version control part if present
    PS1+=%(?..'%F{yellow}%B%'?)       # output last error number if present
    PS1+=$PR_SIGN                 # the user sign
    PS1+=" "                      # an additional space

    # reset the tmux title
    promptSetMultiplexerTabTitle "zsh"
}
add-zsh-hook precmd promptSetup

# set a tmux / screen 'tabulator' title if needed
function promptSetMultiplexerTabTitle () {
    if [[ "$TERM" == "screen" ]]; then
        if [[ "$1" == "" ]]; then
            local CMD=${1[(wr)^(*=*|sudo|-*)]}
            echo -n "\ek$CMD\e\\"
        else
            echo -n "\ek$1\e\\"
        fi
    fi
}
add-zsh-hook preexec promptSetMultiplexerTabTitle

# setup tmux environment (context + status)
function tmuxChangeDirectory () {
    # set the tmux status line
    if [[ "$TMUX" != "" ]]; then
        tmux set-option -g status-right $OLDPWD >/dev/null
    fi

    if [[ $VCS_TYPE == 'hg' ]]; then
        #tmux kill-pane -t 1
        #tmux split-window -h -l 40 "while true; do clear; date; echo; hg xlog-small -l 5 || exit; sleep 600; done;"
        #tmux select-pane -t 0
    fi
}
add-zsh-hook chpwd tmuxChangeDirectory

# remove the line after the prompt on execution
# http://unix.stackexchange.com/questions/1022/is-it-possible-to-display-stuff-below-the-prompt-at-a-prompt
function eraseSecondLine () {
    print -rn -- $terminfo[el];
    #echo; # this would keep the second line
}
add-zsh-hook preexec eraseSecondLine

