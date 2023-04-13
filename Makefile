dev:
	@ZDOTDIR=$(PWD) zsh || true

clean:
	@rm -rf .revolver plugins .zcompdump
