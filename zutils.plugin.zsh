#!/usr/bin/env zsh

# ==> https://wiki.zshell.dev/community/zsh_plugin_standard#zero-handling
0="${ZERO:-${${0:#$ZSH_ARGZERO}:-${(%):-%N}}}"
0="${${(M)0:#/*}:-$PWD/$0}"

# ==> global variables
typeset -gA ZUTILS
: ${ZUTILS[HOME_PATH]:=${0:h}}
: ${ZUTILS[PLUGINS_PATH]:=${ZUTILS[HOME_PATH]}/packages}
: ${ZSH_CACHE_DIR:=${HOME}/.cache}

# ==> setup pmspec
# i - the zsh_loaded_plugins activity indicator,
# s - the PMSPEC global parameter itself (i.e.: should be always present).
export PMSPEC="is"

# ==> setup autoload
fpath+=( ${0:h}/core  "${HOME}/.cache/completions" )
autoload -Uz ${0:h}/core/*(.ND:t)

autoload colors && colors
autoload compinit && compinit -u

functions[.init]=${functions[.init]//source/@zu-source}
functions[.init]=${functions[.init]//has/@zu-has}

# deps
@zu-source "romkatv/zsh-defer"

# plugins
.init && unset -f .init

# after
autoload compinit && compinit -u
