# @author     Sebastian Tramp <mail@sebastian.tramp.name>
# @license    http://opensource.org/licenses/gpl-license.php
#
# the main RC file (will be linked to ~/.zshrc)
#

typeset -ga sources
sources+="$HOME/.zsh/options"
sources+="$HOME/.zsh/prompt"
sources+="$HOME/.zsh/functions"
sources+="$HOME/.zsh/private"
sources+="$HOME/.zsh/aliases"
sources+="$HOME/.zsh/completion"
sources+="$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
sources+="/etc/zsh_command_not_found"

foreach file (`echo $sources`)
    if [[ -a $file ]]; then
        source $file
    fi
end

