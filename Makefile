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
	touch $(HOME)/.zshrc # In cases, where no .zshrc already exists
	mv $(HOME)/.zshrc ./zshrc.bak
	ln -s $(PWD)/zshrc $(HOME)/.zshrc
	mkdir -p $(HOME)/.local/share # Autojump writes to this dir if existing (otherwise we get a autojump_erros file)
	touch history private.zsh
	hg clone git://github.com/joelthelion/autojump.git
	hg clone git://github.com/nicoulaj/zsh-syntax-highlighting.git
	hg clone git://github.com/robbyrussell/oh-my-zsh.git
	hg clone git://fizsh.git.sourceforge.net/gitroot/fizsh/fizsh
	mkdir -p $(PWD)/functions.d
	cp -f $(PWD)/autojump/_j $(PWD)/functions.d/_j
	sudo ln -sf $(PWD)/autojump/autojump /usr/bin/autojump

clean: 
	rm -r ./autojump
	rm -r ./zsh-syntax-highlighting
	rm -r ./oh-my-zsh
	rm -r ./fizsh