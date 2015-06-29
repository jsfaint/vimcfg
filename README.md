vimcfg
======

This repository is my personal Vim configurations, include configuration and plugins.
The plugins are managed by [neobundle](https://github.com/Shougo/neobundle.vim).

Usage
-----
1. Install git on your OS
  * For Windows user: Install [windows for git](https://msysgit.github.io/)
  * For Linux user: Install git via your [package manager](https://en.wikipedia.org/wiki/Package_manager)
  * For OSX user: Install git via [homebrew](http://brew.sh/)

2. Clone vimcfg repos

  ```
  git clone https://github.com/jsfaint/vimcfg.git
  ```

2. Init submodules (NeoBundle)

  ```
  cd vimcfg
  git submodule update --init
  ```

3. Create symbolic links
  * Linux/OSX

    ```
    ln -s vimcfg/_vimrc ~/.vimrc
    ln -s vimcfg/vimfiles ~/.vim
    ```

  * Windows
    You can create quick link to c:/Users/[uername]/.vim
    But maybe it's easier to install vim into the vimcfg folder.

    If you install vim into vimcfg folder the treeview will like below:

    ```
    vimcfg
    +-- .git
    +-- vim74
    +-- vimfiles
    +-- .gitignore
    +-- .gitmodules
    +-- _vimrc
    +-- build_ycm.sh
    +-- README.md
    ```

4. Install other plugins

  Open Vim then NeoBundle will install other plugins automatically

5. Update plugins

  The plugins can be updated by `:NeoBundleUpdate` command.

Other
-----
For more details about `neobundle`  
Please refer [here](https://github.com/Shougo/neobundle.vim/blob/master/README.md) or `:help neobundle`

And also you can fork this repository, if you want to custom your own configuration.

**Thanks for reading :)**
