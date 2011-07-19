UNAME_INSTALL=install-$(shell uname -s)

update:
	git submodule foreach git pull

install: install-externals install-core $(UNAME_INSTALL)

install-core:
	@echo "Core install tasks."
	@echo "Backing up your .zshrc iff neccessary..."
	@!(ls $(HOME)/.zshrc > /dev/null 2> /dev/null) || mv $(HOME)/.zshrc $(PWD)/zshrc.bak # Make backup of -zshrc if necessary
	@echo "Creating .zshrc in your home directory..."
	@ln -s $(PWD)/zshrc $(HOME)/.zshrc # update the link to .zshrc
	@echo "Creating .zsh directory in your home directoy iff neccessary..."
	@ls $(HOME)/.zsh > /dev/null 2> /dev/null || ln -s $(PWD) $(HOME)/.zsh # Create .zsh dir link if not existing
	@echo "Creating $(HOME)/.local/share iff neccessary (for autojump errors)..."
	@mkdir -p $(HOME)/.local/share # Autojump writes to this dir if existing (otherwise we get a autojump_erros file)
	@echo "Creating functions.d directory iff neccessary (for autocompletion files)..."
	@mkdir -p $(PWD)/functions.d # folder for autocompletion files
	@echo "Copying autojump autocompletion script..."
	@cp -f $(PWD)/autojump/_j $(PWD)/functions.d/_j
	@echo "Creating custom user files iff neccessary..."
	@touch history private.zsh # create custom files for users
	@echo "DONE with core install tasks."

install-externals:
	git submodule init
	git submodule update
	
install-Darwin:
	@echo "Darwin specific install tasks."
	@echo "Creating $(HOME)/bin directory iff neccessary..."
	@ls $(HOME)/bin 2>&1> /dev/null || (mkdir -p $(HOME)/bin && SetFile -a "V" $(HOME)/bin) 
	@echo "Copying autojump to bin directory..."
	@ln -sf $(PWD)/autojump/autojump $(HOME)/bin/autojump
	@echo "DONE with Darwin install tasks."
	
install-Linux:
	@echo "Linux specific install tasks."
	@echo "DONE."

