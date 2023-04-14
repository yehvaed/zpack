#!/usr/bin/env zsh

# https://wiki.zshell.dev/community/zsh_plugin_standard#zero-handling
0="${ZERO:-${${0:#$ZSH_ARGZERO}:-${(%):-%N}}}"
0="${${(M)0:#/*}:-$PWD/$0}"

typeset -gA ZUTILS
: ${ZUTILS[HOME_DIR]:=${0:h}}
: ${ZUTILS[PLUGINS_DIR]:=${0:h}/plugins}
: ${ZSH_CACHE_DIR:=${HOME}/.cache}

path+=( "/usr/local/bin" )

local autoload_dirs=( ${0:h}/core/**/*(/) ${0:h}/core  ${0:h}/syntax )
fpath+=( ${(@)autoload_dirs} "${HOME}/.cache/completions" )

for dir in ${(@)autoload_dirs}; do
	autoload -Uz ${dir}/*(.ND:t) > /dev/null
done

local -a pmspec=(
	# "f" # supports the functions/ subdirectory,
	"i" # the zsh_loaded_plugins activity indicator,
	"s" # the PMSPEC global parameter itself (i.e.: should be always present).
)
export PMSPEC="${(j::)pmspec}"
unset pmspec

autoload colors && colors
autoload compinit && compinit -u

functions[.zpack_bootstrap]=$(
  echo ${functions[.init]} \
	| sed 's/source/@source/g' \
	| sed 's/has/@has/g'
)

.init() {
	source "romkatv/zsh-defer"
}

functions[.zpack_bootstrap_base]=$(
  echo ${functions[.init]} \
	| sed 's/source/@source/g' \
	| sed 's/has/@has/g'
)

.zpack_bootstrap_base
.zpack_bootstrap

[[ -n "${ZU_EVENT_NEW_PLUGINS}" ]] && echo "\nYour shell is up to date 🎉" && unset ZU_EVENT_NEW_PLUGINS

autoload compinit && compinit -u
