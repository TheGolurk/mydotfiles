#/bin/bash

# TODO: Parameters to: configure vim only, install or stuff like that. Validate (in case of install)
# if files are already installed

# Usage: ./load.sh [OPTION1] [OPTION...]
# Options: [move, replace, vim, validate]


function move_files {
	cp vimrc ~/.vimrc
	cp golurk.zsh-theme ~/.oh-my-zsh/custom/themes/golurk.zsh-theme
	cp zshrc ~/.zshrc
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
	
	# Node
	if which node > /dev/null
		then
			echo "node is alredy installed..."

		else
			curl -sL install-node.now.sh/lts | bash
	
	fi

	# Go
	if which go > /dev/null
		then
			echo "golang alredy installed"

		else
			# 1.16
			curl -O https://golang.org/dl/go1.16.4.linux-amd64.tar.gz
			sudo rm -rf /usr/local/go && tar -C /usr/local -xzf go1.16.4.linux-amd64.tar.gz
			export PATH=$PATH:/usr/local/go/bin
	
			# inside zsh or bash
			echo export PATH=$PATH:/usr/local/go/bin >> ~/.zshrc
			echo export GOBIN=$(go env GOPATH)/bin >> ~/.zshrc
			source ~/.zshrc

	fi

}

move_files
replace_files

validate_installations
install_vim_requirements
