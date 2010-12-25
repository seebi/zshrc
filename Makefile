install:
	mv ../.zshrc zshrc.bak
	ln -s zshrc ../.zshrc
	touch history private
	hg clone git://github.com/nicoulaj/zsh-syntax-highlighting.git
