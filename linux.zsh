
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
alias agi='sudo apt-get install'
alias ag='sudo apt-get'
alias agu='sudo apt-get update'
alias agug='sudo apt-get upgrade'
alias agr='sudo apt-get uninstall'
alias agp='sudo apt-get purge'

