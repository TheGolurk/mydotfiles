#/bin/bash

function move_files {
	cp vimrc ~/.vimrc
	cp golurk.zsh-theme ~/.oh-my-zsh/custom/themes/golurk.zsh-theme
}

function replace_files {
	sed -i -E 's/ZSH_THEME=\"(.*[a-zA-Z0-9])"/ZSH_THEME="golurk"/' ~/.zshrc
}

function install_vim_requirements {
	# Vim Plug
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

	# Vim Vundle
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
}

function validate_installations {
	# git
	git --version 2>&1 >/dev/null
	GIT_IS_AVAILABLE=$?
	if [ $GIT_IS_AVAILABLE != 0 ]; then
		# fedora
		dnf install -y git
	fi
}

move_files
replace_files

validate_installations
install_vim_requirements
