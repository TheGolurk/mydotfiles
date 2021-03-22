#/bin/bash

function move_files {
	cp vimrc ~/.vimrc
	cp golurk.zsh-theme ~/.oh-my-zsh/custom/themes/golurk.zsh-theme
}

function replace_files {
	sed -i -E 's/ZSH_THEME=\"(.*[a-zA-Z0-9])"/ZSH_THEME="golurk"/' ~/.zshrc
}

move_files
replace_files
