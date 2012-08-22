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
if [[ -a $HOME/.dir_colors ]]; then
    if [[ "$TERM" == *256* ]]; then
        which gdircolors > /dev/null && eval "`gdircolors -b $HOME/.dir_colors`"
    else
        # standard colors for non-256-color terms
        which gdircolors > /dev/null && eval "`gdircolors -b`"
    fi
else
    which gdircolors > /dev/null && eval "`gdircolors -b`"
fi
