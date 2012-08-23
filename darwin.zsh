# @author     Philipp Frischmuth <frischmuth@informatik.uni-leipzig.de>
# @author     Sebastian Tramp <mail@sebastian.tramp.name>
# @license    http://opensource.org/licenses/gpl-license.php
#
# darwin specific fixes / alignments

# Darwin ls command does not support --color option.
alias ls=' ls'
#alias myls=' ls'
# use gnu ls instead of bsd ls
alias myls=' gls -C -F -h --color=always'

# The OSX way for ls colors.
export CLICOLOR=1
export LSCOLORS="gxfxcxdxbxegedabagacad"

# brew install zsh-completions
export FPATH=/usr/local/share/zsh-completions:$FPATH

# activate gls colors
export ZSH_DIRCOLORS="$ZSH_CONFIG/dircolors-solarized/dircolors.256dark"
if [[ -a $ZSH_DIRCOLORS ]]; then
    if [[ "$TERM" == *256* ]]; then
        which gdircolors > /dev/null && eval "`gdircolors -b $ZSH_DIRCOLORS`"
    else
        # standard colors for non-256-color terms
        which gdircolors > /dev/null && eval "`gdircolors -b`"
    fi
else
    which gdircolors > /dev/null && eval "`gdircolors -b`"
fi
