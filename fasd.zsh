# @author     Sebastian Tramp <mail@sebastian.tramp.name>
# @license    http://opensource.org/licenses/gpl-license.php
#
# fasd integration
# https://github.com/clvv/fasd
#

# init fasd, the autojump successor

# fasd_cd + outputs directory
fasd_cd() {
  if [ $# -le 1 ]; then
    fasd "$@"
  else
    local _fasd_ret="$(fasd -e 'printf %s' "$@")"
    [ -z "$_fasd_ret" ] && return
    [ -d "$_fasd_ret" ] && print "$_fasd_ret" && cd "$_fasd_ret" || printf %s\n "$_fasd_ret"
  fi
}

if type fasd &>/dev/null
then
    #eval "$(fasd --init auto)"
    eval "$(fasd --init zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install)"
    # as an autojump user, i need only this for now
    alias j=' fasd_cd -d'
fi
