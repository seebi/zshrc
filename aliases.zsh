# @author     Sebastian Tramp <mail@sebastian.tramp.name>
# @license    http://opensource.org/licenses/gpl-license.php
#
# alias definitions which can be edited/modified with 'aedit'
#

export EDITOR="vim"
alias aedit=" $EDITOR ~/.zsh/aliases.zsh; source ~/.zsh/aliases.zsh"
alias fedit=" $EDITOR ~/.zsh/functions.zsh; source ~/.zsh/functions.zsh"
alias pedit=" $EDITOR ~/.zsh/private.zsh; source ~/.zsh/private.zsh"
alias vedit=" $EDITOR ~/.vimrc"
alias gedit=" $EDITOR ~/.gitconfig"

#alias man="unset PAGER; man"
alias grep='grep --color=auto'

alias feierabend='sudo shutdown -h now'
alias j=' j'

##### standard aliases (start with a space to be ignored in history)
# default ls is untouched, except coloring
alias ls=' ls --color=auto'
alias myls=' ls -C -F -h --color=always'
alias l=" myls"
alias ll=' myls -l'
alias la=' myls -A'
alias v=" clear; ll -g"    # standard directory view
alias vs=" v **/*(.)"         # show all files in all subdirs plain in a list

alias p=' ps aux | grep'
alias g=' git'
alias d=' dirs -v'

#alias .='xdg-open .'
alias cd=' cd'
alias ..=' cd ..; ls'
alias ...=' cd ..; cd ..; ls'
alias ....=' cd ..; cd ..; cd ..; ls'
alias cd..='..'
alias cd...='...'
alias cd....='....'

# alias to create a next-link in your home to tag the current workingdir
alias linkthis='rm -f ~/next; ln -s $PWD ~/next'

##### global aliases
# zsh buch s.82 (z.B. find / ... NE)
alias -g NE='2>|/dev/null'
alias -g NO='&>|/dev/null'

# http://rayninfo.co.uk/tips/zshtips.html
alias -g G='| grep -'
alias -g P='2>&1 | $PAGER'
alias -g L='| less'
alias -g M='| most'
alias -g C='| wc -l'

# http://www.commandlinefu.com/commands/view/7284/zsh-suffix-to-inform-you-about-long-command-ending
# zsh suffix to inform you about long command ending make, Just add "R" (without quotes) suffix to it and you can do other things: 
# zsh will inform you when you can see the results.
alias -g R=' &; jobs | tail -1 | read A0 A1 A2 cmd; echo "running $cmd"; fg "$cmd"; zenity --info --text "$cmd done"; unset A0 A1 A2 cmd'

##### suffix aliases (mostly mapped to xdg-open which runs the gnome/kde default app)

alias -s tex="rubber --inplace --maxerr -1 --short --force --warn all --pdf"

alias -s 1="man -l"
alias -s 2="man -l"
alias -s 3="man -l"
alias -s 4="man -l"
alias -s 5="man -l"
alias -s 6="man -l"
alias -s 7="man -l"
alias -s pdf="xdg-open"
alias -s PDF="xdg-open"
alias -s xoj="xournal"

alias -s jar="java -jar"

alias -s iso="vlc"
alias -s avi=" xdg-open"
alias -s AVI=" xdg-open"
alias -s mov=" xdg-open"
alias -s mpg=" xdg-open"
alias -s m4v=" xdg-open"
alias -s mp4=" xdg-open"
alias -s MP4=" xdg-open"
alias -s ogg=" xdg-open"
alias -s ogv=" xdg-open"
alias -s flv=" xdg-open"
alias -s mkv=" xdg-open"

alias -s tif="xdg-open"
alias -s tiff="xdg-open"
alias -s png="xdg-open"
alias -s jpg="xdg-open"
alias -s jpeg="xdg-open"
alias -s JPG="xdg-open"
alias -s gif="xdg-open"
alias -s svg="xdg-open"
alias -s psd="xdg-open"

alias -s com="xdg-open"
alias -s de="xdg-open"
alias -s org="xdg-open"

alias -s rdf="rapper --count"
alias -s owl="rapper --count"
alias -s ttl="rapper -i turtle --count"
alias -s tt="rapper -i turtle --count"
alias -s n3="rapper -i turtle --count"
alias -s nt="rapper -i ntriples --count"
alias -s ntriples="rapper -i ntriples --count"
alias -s ntriple="rapper -i ntriples --count"

alias -s ods="xdg-open"
alias -s xls="xdg-open"
alias -s xlsx="xdg-open"
alias -s csv="xdg-open"

alias -s odt="xdg-open"
alias -s doc="xdg-open"
alias -s docx="xdg-open"
alias -s rtf="xdg-open"
alias -s dot="xdg-open"

alias -s ppt="xdg-open"
alias -s pptx="xdg-open"
alias -s odp="xdg-open"

alias -s sla="xdg-open"

alias -s exe="xdg-open"

