# Vim files

These are my vim files.

## Install

I use [ghar](https://github.com/philips/ghar) to "install" .vim and .vimrc to ~/ by:

    ghar add git@github.com:mlb-/vim_files &&\
    (cd ~/ghar/vim_files && git submodule update --init) &&\
    ghar install &&\
    vim +BundleInstall! +:qa

# Contents

Hopefully, my .vimrc is well enough commented and organized to easily
navigate. As with nearly any dotfile collection, this is a work in progress
and I'm definitely not done scraping together improvements upon what I see
elsewhere.

## Credits

While I certainly had enough of my own settings clobbered from various rc
files seen in the wile, inspiration to organize and publish my personal
attempt was taken from:

 - [aerosol](https://github.com/aerosol/vim-conf)
 - [zaiste](https://github.com/zaiste/vimified)
 - [mutewinter](https://github.com/mutewinter/dot_vim)
 - [gmarik](https://github.com/gmarik/vimfiles)

vim: ft=markdown et
