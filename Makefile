update:
	hg pull -q --repository autojump
	@hg update --repository autojump
	hg pull -q --repository zsh-syntax-highlighting
	@hg update --repository zsh-syntax-highlighting
	hg pull -q --repository oh-my-zsh
	@hg update --repository oh-my-zsh
	hg pull -q --repository fizsh
	@hg update --repository fizsh

install:
	mv ../.zshrc zshrc.bak
	ln -s zshrc ../.zshrc
	touch history private
	hg clone git://github.com/joelthelion/autojump.git
	hg clone git://github.com/nicoulaj/zsh-syntax-highlighting.git
	hg clone git://github.com/robbyrussell/oh-my-zsh.git
	hg clone git://fizsh.git.sourceforge.net/gitroot/fizsh/fizsh
