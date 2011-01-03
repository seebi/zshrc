# @author     Sebastian Tramp <mail@sebastian.tramp.name>
# @license    http://opensource.org/licenses/gpl-license.php
#
# the main RC file (will be linked to ~/.zshrc)
#

typeset -ga sources
#sources+="$HOME/.zsh/colors.zsh" # maybe we do not need this anymore
sources+="$HOME/.zsh/options.zsh"
sources+="$HOME/.zsh/prompt.zsh"
sources+="$HOME/.zsh/functions.zsh"
sources+="$HOME/.zsh/private.zsh"
sources+="$HOME/.zsh/aliases.zsh"
sources+="$HOME/.zsh/completion.zsh"

# highlights the live command line
# Cloned From: git://github.com/nicoulaj/zsh-syntax-highlighting.git
sources+="$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# provides the package name of a non existing executable
# (sudo apt-get install command-not-found)
sources+="/etc/zsh_command_not_found"

# Autojump: a cd command that learns
# Cloned From: git://github.com/joelthelion/autojump.git
sources+="$HOME/.zsh/autojump/autojump.zsh"

foreach file (`echo $sources`)
    if [[ -a $file ]]; then
        source $file
    fi
end

