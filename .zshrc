typeset -F4 SECONDS=0
zmodload zsh/zprof

.init() {
	# ==> completion helpers
	has 'fzf' && source 'Aloxaf/fzf-tab' defer'idle'
	has 'fzf' && source 'joshskidmore/zsh-fzf-history-search' defer'idle'

	# # ==> zle helpers
	source 'hlissner/zsh-autopair' defer'idle'
	source 'z-shell/F-Sy-H' defer'idle'
	source 'olets/zsh-abbr' defer'idle'
	source '@omzp/fancy-ctrl-z' defer'idle'

	# # ==> productivity
	source '@omzp/fasd' defer'idle' has'fasd'
	source 'zpm-zsh/undollar' defer'idle'

	# # ==> habits
	source 'MichaelAquilina/zsh-you-should-use' defer'idle'
	source 'ahmubashshir/zinsults' defer'idle'

	# ==> tools dev
	has 'git' && source "@omzp/git" defer'idle'
	has 'gh' && source "@omzp/gh" defer'idle'

	# # ==> misc
	has 'exa' && source 'MohamedElashri/exa-zsh' defer'idle'  # ls

	# # ==> config
	source "@omzl/history"

	source "jeffreytse/zsh-vi-mode"

	# ==> theme
	source "romkatv/powerlevel10k" pick"powerlevel10k.zsh-theme"
}

() {
	# ==> @omzl/history
	export HISTSIZE=5000000
	export SAVEHIST=1000000
	export HISTFILE=${HOME}/.zhistory

	# ==> MichaelAquilina/zsh-you-should-use
	export YSU_MESSAGE_POSITION="after"

	# ===> romkatv/powerlevel10k
	export POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

	# ===> jeffreytse/zsh-vi-mode
	export ZVM_INIT_MODE=sourcing
}

source zutils.plugin.zsh
# local endtime="${(M)$(( SECONDS * 1000 ))#*.?}"
# zprof; print "\n[zshrc] zutils took ${endtime} ms"
