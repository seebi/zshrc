# @author     Sebastian Tramp <mail@sebastian.tramp.name>
# @license    http://opensource.org/licenses/gpl-license.php
#
# alias definitions which can be edited/modified with 'aedit'
#

export EDITOR="vim"
# But still use emacs-style zsh bindings
# http://superuser.com/questions/403355/how-do-i-get-searching-through-my-command-history-working-with-tmux-and-zshell
bindkey -e

alias vi="vim"
alias aedit=" $EDITOR $ZSH_CONFIG/aliases.zsh; source $ZSH_CONFIG/aliases.zsh"
alias fedit=" $EDITOR $ZSH_CONFIG/functions.zsh; source $ZSH_CONFIG/functions.zsh"
alias pedit=" $EDITOR $ZSH_CONFIG/private.zsh; source $ZSH_CONFIG/private.zsh"
alias viedit=" $EDITOR $HOME/.vim/vimrc"

alias ocr='docker run --rm -v `pwd`:/home/docker jbarlow83/ocrmypdf --skip-text'

# N-Triples aliases from http://blog.datagraph.org/2010/03/grepping-ntriples
alias rdf-count="awk '/^\s*[^#]/ { n += 1 } END { print n }'"
alias rdf-lengths="awk '/^\s*[^#]/ { print length }'"
alias rdf-length-avg="awk '/^\s*[^#]/ { n += 1; s += length } END { print s/n }'"
alias rdf-length-max="awk 'BEGIN { n=0 } /^\s*[^#]/ { if (length>n) n=length } END { print n }'"
alias rdf-length-min="awk 'BEGIN { n=1e9 } /^\s*[^#]/ { if (length>0 && length<n) n=length } END { print (n<1e9 ? n : 0) }'"
alias rdf-subjects="awk '/^\s*[^#]/ { print \$1 }' | uniq"
alias rdf-predicates="awk '/^\s*[^#]/ { print \$2 }' | uniq"
alias rdf-objects="awk '/^\s*[^#]/ { ORS=\"\"; for (i=3;i<=NF-1;i++) print \$i \" \"; print \"\n\" }' | uniq"
alias rdf-datatypes="awk -F'\x5E' '/\"\^\^</ { print substr(\$3, 2, length(\$3)-4) }' | uniq"

#alias man="unset PAGER; man"
alias grep='grep --color=auto'

alias sign='gpg --detach-sign --armor'

alias SimpleServer='open http://localhost:8000; python -m SimpleHTTPServer'

##### standard aliases (start with a space to be ignored in history)
# default ls is untouched, except coloring
alias ls=' ls --color=auto'
alias myls=' ls -C -F -h --color=always'
alias l=" myls -l"
alias ll=' myls -l'
alias la=' myls -lA'
alias v=" clear; ll -gh"    # standard directory view
alias vs=" v **/*(.)"         # show all files in all subdirs plain in a list

alias p=' ps aux | grep'
alias g='git'
alias b='brew'
alias d=' dirs -v'
alias ka="killall"

alias cd=' cd'
alias ..=' cd ..; ls'
alias ...=' cd ..; cd ..; ls'
alias ....=' cd ..; cd ..; cd ..; ls'
alias cd..='..'
alias cd...='...'
alias cd....='....'

alias k9='kill -9'

##### global aliases
# zsh buch s.82 (z.B. find / ... NE)
alias -g NE='2>|/dev/null'
alias -g NO='&>|/dev/null'
alias -g EO='>|/dev/null'

# http://rayninfo.co.uk/tips/zshtips.html
alias -g G='| grep '
alias -g P='2>&1 | $PAGER'
alias -g L='| less'
alias -g LA='2>&1 | less'
alias -g M='| most'
alias -g C='| wc -l'

# http://www.commandlinefu.com/commands/view/7284/zsh-suffix-to-inform-you-about-long-command-ending
# zsh suffix to inform you about long command ending make, Just add "R" (without quotes) suffix to it and you can do other things: 
# zsh will inform you when you can see the results.
#alias -g R=' &; jobs | tail -1 | read A0 A1 A2 cmd; echo "running $cmd"; fg "$cmd"; zenity --info --text "$cmd done"; unset A0 A1 A2 cmd'

##### suffix aliases (mostly mapped to open which runs the gnome/kde default app)

alias -s Dockerfile="docker build - < "

alias ocr='docker run --rm -v `pwd`:/home/docker jbarlow83/ocrmypdf --skip-text'
alias -s tex='docker run -i -t --rm -v `pwd`:/build docker-registry.eccenca.com/eccenca-latex:v1.4.0 rubber --inplace --maxerr -1 --short --force --warn all --pdf'

alias -s 1="man -l"
alias -s 2="man -l"
alias -s 3="man -l"
alias -s 4="man -l"
alias -s 5="man -l"
alias -s 6="man -l"
alias -s 7="man -l"
alias -s epub="open"
alias -s pdf="open -a Skim"
alias -s PDF="open -a Skim"
alias -s xoj="xournal"

alias -s md=" open"
alias -s markdown="open"
alias -s htm="$BROWSER"
alias -s html="$BROWSER"
alias -s jar="java -jar"
alias -s war="java -jar"
alias -s deb="sudo dpkg -i"
alias -s gpg="gpg"

alias -s iso="vlc"
alias -s avi=" open"
alias -s AVI=" open"
alias -s mov=" open"
alias -s mpg=" open"
alias -s m4v=" open"
alias -s mp4=" open"
alias -s rmvb=" open"
alias -s MP4=" open"
alias -s ogg=" open"
alias -s ogv=" open"
alias -s flv=" open"
alias -s mkv=" open"
alias -s wav=" open"
alias -s mp3=" open"
alias -s webm=" open"

alias -s tif="open"
alias -s tiff="open"
alias -s png="open"
alias -s jpg="open"
alias -s jpeg="open"
alias -s JPG="open"
alias -s gif="open"
alias -s svg="open"
alias -s psd="open"

alias -s com="open"
alias -s de="open"
alias -s org="open"

alias -s rdf="rapper --count"
alias -s owl="rapper --count"
alias -s ttl="rapper -i turtle --count"
alias -s tt="rapper -i turtle --count"
alias -s n3="rapper -i turtle --count"
alias -s nq="rapper -i nquads --count"
alias -s nt="rapper -i ntriples --count"
alias -s ntriples="rapper -i ntriples --count"
alias -s ntriple="rapper -i ntriples --count"
alias -s trig="rapper -i trig --count"

alias -s ods="open"
alias -s xls="open"
alias -s xlsx="open"
alias -s csv="open"

alias -s pot="open"
alias -s odt="open"
alias -s doc="open"
alias -s docx="open"
alias -s rtf="open"
alias -s dot="dot -Tpng -O"

alias -s ppt="open"
alias -s pptx="open"
alias -s odp="open"

alias -s plist="plutil"
alias -s log="open"

alias -s sla="open"

alias -s exe="open"

alias -s tjp="tj3"
alias -s asc="gpg"
alias -s pem="openssl x509 -noout -text -in "
