dev:
	@ZDOTDIR=$(PWD) zsh || true

debug:
	@ZDOTDIR=$(PWD) zsh -x || true


clean:
	@rm -rf .revolver plugins .zcompdump
