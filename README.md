# vimcfg

This repository is my personal Vim configurations, include configuration and plugins.
The plugins are managed by [neobundle](https://github.com/Shougo/neobundle.vim).

## Usage

1. Install git on your OS
  * For Windows user: Install [windows for git](https://git-for-windows.github.io)
  * For Linux user: Install git via your [package manager](https://en.wikipedia.org/wiki/Package_manager)
  * For OS X user: Install git via [homebrew](http://brew.sh/)

2. Clone vimcfg repos

  ```
  git clone https://github.com/jsfaint/vimcfg.git
  ```

3. Create symbolic links
  * Linux/OS X

    ```
    ln -s vimcfg/_vimrc ~/.vimrc
    ln -s vimcfg/vimfiles ~/.vim
    ```

  * Windows
    Install vim into the vimcfg diretory and the treeview should like below:

    ```
    vimcfg
    +-- .git
    +-- vim74 (vim install directory)
    +-- vimfiles
    +-- .gitignore
    +-- .gitmodules
    +-- _vimrc
    +-- README.md
    ```

4. Install other plugins

  Open Vim then NeoBundle will install other plugins automatically

5. Update plugins

  The plugins can be updated by `:NeoBundleUpdate` command.

6. Post install

  Some plugins require external command.
  * `fencview` require vim has `iconv` feature and an external lib `iconv.dll` for windows.
  * `neocomplete` require vim has `if_lua` feature.
  * `vim-clang` require Clang for C-family completion.
  * `syntastic` need to install external checker for different filetype.
  * `vimproc` need to build C code to dll on windows, which will auto build for Linux and OS X.
  * `vim-go` need to install binary tool via `:GoInstallBinaries`
  * `gen_tags.vim` require [ctags](http://ctags.sourceforge.net/) and [GNU global](http://www.gnu.org/software/global/)
  * `tern_for_vim` require install tern (node.js based)

## How to update neobundle.vim

neobundle.vim is managed by git subtree.<br/>
So if you need to update it. please use the following command.

```
git subtree pull --prefix vimfiles/bundle/neobundle.vim https://github.com/Shougo/neobundle.vim.git master --squash
```

Be sure don't forget the paramenter `--squash`, otherwise all the history of subtree will be add to your history.

## Other

For more details about `neobundle`</br>
Please refer [here](https://github.com/Shougo/neobundle.vim/blob/master/README.md) or `:help neobundle`

And also you can fork this repository, if you want to custom your own configuration.

**Thanks for reading :)**
