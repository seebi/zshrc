# @author     Sebastian Tramp <mail@sebastian.tramp.name>
# @license    http://opensource.org/licenses/gpl-license.php
#
# the main RC file (will be linked to ~/.zshrc)
#

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export ZSH_CONFIG="$XDG_CONFIG_HOME/zsh"
export ZSH_CACHE="$XDG_CACHE_HOME/zsh"
mkdir -p $ZSH_CACHE

typeset -ga sources
sources+="$ZSH_CONFIG/options.zsh"
sources+="$ZSH_CONFIG/prompt.zsh"
sources+="$ZSH_CONFIG/functions.zsh"
sources+="$ZSH_CONFIG/aliases.zsh"

# highlights the live command line
# Cloned From: git://github.com/nicoulaj/zsh-syntax-highlighting.git
sources+="$ZSH_CONFIG/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# provides the package name of a non existing executable
# (sudo apt-get install command-not-found)
sources+="/etc/zsh_command_not_found"

# Autojump: a cd command that learns
# Cloned From: git://github.com/joelthelion/autojump.git
sources+="$ZSH_CONFIG/autojump/autojump.zsh"

# Check for a system specific file
systemFile=`uname -s | tr "[:upper:]" "[:lower:]"`
sources+="$ZSH_CONFIG/$systemFile.zsh"

# Finally include the private.zsh file
sources+="$ZSH_CONFIG/private.zsh"

sources+="$ZSH_CONFIG/completion.zsh"

# try to include all sources
foreach file (`echo $sources`)
    if [[ -a $file ]]; then
        source $file
    fi
end

