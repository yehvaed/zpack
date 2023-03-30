.init() {
	has 'fzf' source 'Aloxaf/fzf-tab' wait'idle'
	has 'fzf' source 'joshskidmore/zsh-fzf-history-search' wait'idle'

	has 'fasd' source '@omzp/fasd' wait'idle'
	has 'exa' source 'MohamedElashri/exa-zsh' wait'idle'

	has 'terraform' source "@omzp/terraform" wait'idle'
	has 'aws' source "@omzp/aws" wait'idle'
	has 'ansible' source "@omzp/ansible" wait'idle'
	has 'nomad' source "@omzp/nomad" wait'idle'
	has 'nomad' source "@omzp/docker" wait'idle'

	has 'npm' source '@omzp/npm' wait'idle'
	has 'yarn' source '@omzp/yarn' wait'idle'

	has 'git' source "@omzp/git" wait'idle'
	has 'gh' source "@omzp/gh" wait'idle'

	source 'hlissner/zsh-autopair' wait'idle'
	source 'z-shell/F-Sy-H' wait'idle'
	source 'olets/zsh-abbr' wait'idle'
	source 'MichaelAquilina/zsh-you-should-use' wait'idle'
	source 'zpm-zsh/undollar' wait'idle'
	source '@omzp/fancy-ctrl-z' wait'idle'

	source "@omzl/history"
	source 'ahmubashshir/zinsults'
	source "romkatv/powerlevel10k" pick"powerlevel10k.zsh-theme"
}

() {
	# ==> @omzl/history
	export HISTSIZE=5000000
	export SAVEHIST=1000000
	export HISTFILE=${HOME}/.zhistory

	# ==> MichaelAquilina/zsh-you-should-use
	export YSU_MESSAGE_POSITION="after"
}

POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
source init.zsh
