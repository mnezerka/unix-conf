# My Unix Config Files
Warning: All stuff you see here was created to support me in unix shell
environment. So be careful :-)

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

```
./vim-install-plugins.sh
```
