# @author     Sebastian Tramp <mail@sebastian.tramp.name>
# @license    http://opensource.org/licenses/gpl-license.php
#
# shell options as history size, keyindings, etc
#

export GREP_OPTIONS='--binary-files=without-match --ignore-case'

# keybindings Strg+v is your friend :-)
bindkey "^[[1;5D" .backward-word
bindkey "^[[1;5C" .forward-word
bindkey "^[[1;6D" backward-delete-word
bindkey "^[[1;6C" delete-word
# alt+left (on mac) deletes word
bindkey "^[" backward-kill-word
# fn-left
bindkey "^[[H" .backward-word
# fn-right
bindkey "^[[F" .forward-word

# arrow up/down searches in history if line is already started
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

# History Settings (big history for use with many open shells and no dups)
# Different History files for root and standard user
if (( ! EUID )); then
    HISTFILE=$ZSH_CACHE/history_root
else
    HISTFILE=$ZSH_CACHE/history
fi
SAVEHIST=10000
HISTSIZE=12000
setopt share_history append_history extended_history hist_no_store hist_ignore_all_dups hist_ignore_space

# 2x control is completion from history!!!
zle -C hist-complete complete-word _generic
zstyle ':completion:hist-complete:*' completer _history
bindkey '^X^X' hist-complete

# If a command is issued that can’t be executed as a normal command, and the command is the name of a directory, perform the cd command to that directory.
setopt AUTO_CD

# Treat  the ‘#’, ‘~’ and ‘^’ characters as part of patterns for filename generation, etc.  (An initial unquoted ‘~’ always produces named directory expansion.)
setopt EXTENDED_GLOB

# If a pattern for filename generation has no matches, print an error, instead of leaving it unchanged in the argument  list. This also applies to file expansion of an initial ‘~’ or ‘=’.
setopt NOMATCH

# no Beep on error in ZLE.
setopt NO_BEEP

# Remove  any right prompt from display when accepting a command line. This may be useful with terminals with other cut/paste methods.
setopt TRANSIENT_RPROMPT

# If unset, the cursor is set to the end of the word if completion is started. Otherwise it stays there and completion is done from both ends.
setopt COMPLETE_IN_WORD

# Make cd push the old directory onto the directory stack.
setopt AUTO_PUSHD

# Don’t push multiple copies of the same directory onto the directory stack.
setopt PUSHD_IGNORE_DUPS

# DON NOT Allow ‘>’ redirection to truncate existing files, and ‘>>’ to create files. Otherwise ‘>!’ or ‘>|’ must be used to truncate  a file, and ‘>>!’ or ‘>>|’ to create a file.
setopt no_clobber


