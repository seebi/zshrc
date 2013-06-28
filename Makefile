XDG_CONFIG_HOME=$(HOME)/.config
XDG_CACHE_HOME=$(HOME)/.cache
ZSH_CONFIG=$(XDG_CONFIG_HOME)/zsh
ZSH_CACHE=$(XDG_CACHE_HOME)/zsh
ZSH_LOCAL=$(HOME)/.local

update:
	git submodule foreach git pull

install: install-externals install-core

install-core:
	@echo "Core install tasks."
	@echo "Backing up your .zshrc iff neccessary..."
	@!(ls $(HOME)/.zshrc > /dev/null 2> /dev/null) || mv $(HOME)/.zshrc $(PWD)/zshrc.bak # Make backup of -zshrc if necessary
	@echo "Creating .zshrc in your home directory..."
	@ln -s $(PWD)/zshrc $(HOME)/.zshrc # update the link to .zshrc
	@echo "Creating directories..."
	@mkdir -p $(XDG_CONFIG_HOME)
	@mkdir -p $(ZSH_CACHE)
	@mkdir -p $(ZSH_LOCAL)/bin
	@mkdir -p $(ZSH_LOCAL)/share
	@echo "Creating zsh directory in your .config directory iff neccessary..."
	@(ls $(ZSH_CONFIG) > /dev/null 2> /dev/null) || ln -s $(PWD) $(ZSH_CONFIG) # Create zsh dir link if not existin
	@echo "Creating functions.d directory iff neccessary (for autocompletion files)..."
	@mkdir -p functions.d # folder for autocompletion files
	@echo "Creating autojump link"
	@(ls $(ZSH_LOCAL)/bin/autojump  > /dev/null 2> /dev/null) || ln -s $(PWD)/autojump/autojump $(ZSH_LOCAL)/bin/autojump
	@echo "Creating custom user files iff neccessary..."
	@touch private.zsh # create custom files for users
	@echo "DONE with core install tasks."

install-externals:
	git submodule update --init

