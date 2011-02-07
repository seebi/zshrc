# @author     Philipp Frischmuth <frischmuth@informatik.uni-leipzig.de>
# @license    http://opensource.org/licenses/gpl-license.php
#
# darwin specific fixes / alignments

# Darwin ls command does not support --color option.
alias ls='ls'

# The OSX way for ls colors.
export CLICOLOR=1
export LSCOLORS="gxfxcxdxbxegedabagacad"
