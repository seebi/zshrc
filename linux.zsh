
# activate ls colors, (private if possible)
if [[ -a $HOME/.dir_colors ]]; then
    if [[ "$TERM" == *256* ]]; then
        which dircolors > /dev/null && eval "`dircolors -b $HOME/.dir_colors`"
    else
        # standard colors for non-256-color terms
        which dircolors > /dev/null && eval "`dircolors -b`"
    fi
else
    which dircolors > /dev/null && eval "`dircolors -b`"
fi

# linux specific aliases
## autocomplete-able apt-xxx aliases
alias acs='apt-cache show'
alias agi='apt-get install'
alias agu='apt-get uninstall'
alias agp='apt-get purge'

