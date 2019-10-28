# Editors and their settings
## Contents
- [Vim](#vim)
  - [Installation](#installation)
  - [Themes & Plugins](#theme-and-plugins)
    - [The Basic Ultimate Vim Configuration](#the-basic-ultimate-vim-configuration)
    - [YouCompleteMe](#autocomplete-with-ycm)

## Vim
### Installation
  
  For Ubuntu 18.04 you can simply install from apt
  ```bash
  sudo apt install vim -y
  ```
### Theme & Plugins
  
You can alter a lot of the settings through changing the`~/.vimrc`However navigating them can be quite daunting, So here are some of the changes that I made.
#### The Basic Ultimate Vim Configuration
Credits to [amix](https://github.com/amix/vimrc) who initialy deviced this configuration. I will here recommend the basic version, especially if you are running vim on a low performance pc or SBC (Single Board Computer), the awesome version will take a pretty long time to boot up with all the plugins.
```bash
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_basic_vimrc.sh
```
I like to have the **line numbers** display on the side of my Vim editor, so I usually put this at the bottom.
```vim
set nu
```

### Autocomplete with YCM (Ubuntu 18.04)
YouCompleteMe is one of the best autocomplete tool for Vim. Especially if you are using vim for custom **cmake** or **python** projects. I often work with ROS, so I chose YCM. 

YCM offcial [repo](https://github.com/ycm-core/YouCompleteMe) is not straightforward to install and navigate. So I will extract some of the useful info and teach you how to use it.

The easiest way is to use [*Vundle*](https://github.com/VundleVim/Vundle.vim)

**1. Install Vundle** 
  ```bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  ```

**2. Build the YCM Library**

Run the following command to download and build the YCM Library
```bash
cd ~/.vim/bundle
git clone https://github.com/ycm-core/YouCompleteMe.git
cd YouCompleteMe
git submodule update --init --recursive
python3 install.py --clang-completer ## I only want the C semantic part for ROS
```
**3. .vimrc**

Put these at the front of the your .vimrc file
```vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setup Vundle
" 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" You Complete me
Plugin 'ycm-core/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

```
[**4. YCM with ROS**](../ros/ide_ros.md#vim-with-ycm-you-complete-me)

**5. My .vimrc**

Here is current [.vimrc]() after  all the customization.

