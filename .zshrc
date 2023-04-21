.init() {
	# ==> completion helpers
	source 'Aloxaf/fzf-tab' when'idle'
	source 'joshskidmore/zsh-fzf-history-search' when'idle'

	# ==> zle helpers
	source 'hlissner/zsh-autopair' when'idle'
	source 'z-shell/F-Sy-H' when'idle'
	source 'olets/zsh-abbr' when'idle'
	source '@omzp/fancy-ctrl-z' when'idle'

	# ==> productivity
	source '@omzp/fasd' when'idle'
	source 'zpm-zsh/undollar' when'idle'

	# ==> habits
	source 'MichaelAquilina/zsh-you-should-use' when'idle'
	source 'ahmubashshir/zinsults' when'idle'

	# ==> tools dev
	source "@omzp/git" when'idle'
	source "@omzp/gh" when'idle'

	# ==> misc
	source 'MohamedElashri/exa-zsh' when'idle' # ls

	# ==> config
	source "@omzl/history"

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
}

source zutils.plugin.zsh
