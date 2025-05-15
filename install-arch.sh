sudo pacman -S clang ripgrep python python-pip python-pynvim shfmt wl-clipboard nvm eslint_d

echo 'export NVM_DIR=~/.nvm' >>~/.zshrc
echo '[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"' >>~/.zshrc
source ~/.zshrc
nvm install stable

./install-npm.sh
