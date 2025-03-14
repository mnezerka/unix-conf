# My Unix Config Files
Warning: All stuff you see here was created to support me in unix shell
environment. So be careful :-)

## Bash config unification

create ~/.bash_profile` as:
```bash
# run .bashrc for both login and non-login shells
if [ -f $HOME/.bashrc ]; then
        source $HOME/.bashrc
fi
```

put all configuration into `~/.bashrc`

## Shell enhancements

Install zsh:
```
sudo apt intall zsh powerline fonts-powerline
```

Install oh my zsh (Oh My ZSH: https://ohmyz.sh/) and set it as default shell:
```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s /bin/zsh
```

Change zsh theme to agnoster

```
ZSH_THEME="agnoster"
```

## Colors
I like Solarized color scheme that can be integrated into shell, vim, etc.
https://ethanschoonover.com/solarized/

Enhance Gnome terminal following instructions here:
https://github.com/aruhier/gnome-terminal-colors-solarized

## Create symlinks
Install stow utility, on macOS:
```
brew install stow
./dfinstall.sh
```

## Vim

Execute following command in `./vim` directory to init/uddate all vim plugins:
```bash
./vim-install-plugins.sh
```

Create symlinks
```bash
cd
ln -s unix-conf/vim/.vim .vim
ln -s unix-conf/vim/.vimrc .vimrc
```

## NeoVim (nvim)

Install "FiraCode Nerd Font" from https://www.nerdfonts.com/font-downloads

Create symlinks
```bash
cd
mkdir -p .config/nvim
ln -s ~/unix-conf/nvim/init.lua .config/nvim/init.lua
ln -s ~/unix-conf/nvim/lua .config/nvim/lua
```

