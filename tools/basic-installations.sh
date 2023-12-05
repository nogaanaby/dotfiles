
#!/usr/bin/env sh

dir=$1
backup_dir=$2


# INSTALL ZSH DOTFILES
if command -v zsh > /dev/null 2>&1
then
  echo "Backing up old ZSH files"
  mv ~/.zshrc $backup_dir/ > /dev/null 2>&1
  echo "...done"
  echo "Creating symlink to new ZSH files"
  touch ~/.zshrc
  echo ". $dir/zsh/zshrc" >> ~/.zshrc
  echo "...done"
fi

# INSTALL AUTO-COMPLETION FILES
echo "Backing up auto-completion files"
mv ~/.completion $backup_dir/ > /dev/null 2>&1
echo "...done"
echo "Creating symlink to new auto-completion files"
ln -s $dir/completion ~/.completion
echo "...done"

# INSTALL OH-MY-ZSH
if command -v zsh > /dev/null 2>&1
then
  if [ ! -d ~/.oh-my-zsh ]; then
    git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
  else
    echo "Backing up old OH-MY-ZSH files"
    cp -pR ~/.oh-my-zsh $backup_dir/
    echo "...done"
  fi

  echo "Overwriting old OH-MY-ZSH files with new files"
  cp -pr $dir/oh-my-zsh/. ~/.oh-my-zsh
  echo "...done"
  echo "Adding OH-MY-ZSH configuration file link to ~/.zshrc"
  # because we don't want to change anything like that in repo
  # we do it in ~/.zshrc
  # $dir/zsh/zshrc is still in active use and all changes in it will take place
  echo ". $dir/zsh/includes/oh-my-zsh" >> ~/.zshrc
  echo "...done"

  if [ ! -n "`$SHELL -c 'echo $ZSH_VERSION'`" ]; then
    echo "Notice! Your current shell is NOT ZSH"
    echo "I suggest you change your shell to ZSH with `chsh -s /bin/zsh`"
  fi
fi

# Local ZSH settings
if command -v zsh > /dev/null 2>&1
then
  if [ ! -f ~/.zshrc.local ]
  then
    touch ~/.zshrc.local
  fi
  echo "Adding local ZSH settings link to ~/.zshrc"
  echo ". ~/.zshrc.local" >> ~/.zshrc
  echo "# Remove duplicates in Paths" >> ~/.zshrc
  echo "declare -U path" >> ~/.zshrc
  echo "...done"
fi



# INSTALL VIM
if command -v vim > /dev/null 2>&1
then
  echo "Vim is already installed"
else
  echo "Installing Vim"
  sudo apt update
  sudo apt install vim

    # Check if Vim installation was successful
    if vim --version > /dev/null 2>&1
    then
    echo "Vim successfully installed"
    echo "Backing up VIM files"
    mv ~/.vim $backup_dir/ > /dev/null 2>&1
    mv ~/.vimrc $backup_dir/ > /dev/null 2>&1
    echo "...done"
    echo "Creating symlink to new VIM files"
    ln -s $dir/vim ~/.vim
    ln -s $dir/vim/vimrc ~/.vimrc
    echo "...done"
    else
    echo "Vim installation failed. Check if sudo privileges are available or install Vim manually."
    fi
fi

# INSTALL VIM DOTFILES
if command -v vim > /dev/null 2>&1
then
  echo "Backing up VIM files"
  mv ~/.vim $backup_dir/ > /dev/null 2>&1
  mv ~/.vimrc $backup_dir/ > /dev/null 2>&1
  echo "...done"
  echo "Creating symlink to new VIM files"
  ln -s $dir/vim ~/.vim
  ln -s $dir/vim/vimrc ~/.vimrc
  echo "...done"
fi

# INSTALL GIT DOTFILES
if command -v git > /dev/null 2>&1
then
  echo "Backing up GIT --global config file"
  # we are copying and not moving because we want to keep personal credentials
  # if they exist
  if [ ! -f ~/.gitconfig ]
  then
    touch ~/.gitconfig
  else
    cp ~/.gitconfig $backup_dir/
  fi
  echo "...done"

  if [ -f ~/.gitignore_global ]
  then
    echo "Backing up GIT --global .gitignore file"
    mv ~/.gitignore_global $backup_dir/
    echo "...done"
  fi

  echo "Creating symlink to new --global .gitignore file"
  ln -s $dir/git/gitignore_global ~/.gitignore_global
  echo "...done"

  echo "Creating new GIT --global config file"
  # set current global credentials (usually set in
  # ~/.gitconfig) or ask for them if not found
  GIT_NAME=`git config --global user.name`
  GIT_EMAIL=`git config --global user.email`

  if [ -z "$GIT_NAME" ]; then
    echo -n "Enter your Name to use in GIT and press [ENTER]: "
    read GIT_NAME
  fi
  if [ -z "$GIT_EMAIL" ]; then
    echo -n "Enter your Email to use in GIT and press [ENTER]: "
    read GIT_EMAIL
  fi

  sed "s|VAR_NAME|$GIT_NAME|;s|VAR_EMAIL|$GIT_EMAIL|;s|VAR_USERNAME|`whoami`|" < $dir/git/gitconfig > ~/.gitconfig
  echo "...done"
fi




# INSTALL TMUX
if command -v tmux > /dev/null 2>&1
then
  echo "tmux is already installed"
else
  echo "Installing tmux"
  sudo apt install tmux

  # Check if tmux installation was successful
  if tmux -V > /dev/null 2>&1
  then
    echo "tmux successfully installed"
    echo "Backing up TMUX files"
    mv ~/.tmux.conf $backup_dir/ > /dev/null 2>&1
    echo "...done"
    echo "Creating symlink to new TMUX files"
    ln -s $dir/tmux/tmuxrc ~/.tmux.conf
    echo "...done"
  else
    echo "tmux installation failed. Check if sudo privileges are available or install tmux manually."
  fi
fi


# INSTALL TMUX DOTFILES
if command -v tmux > /dev/null 2>&1
then
  echo "Backing up TMUX files"
  mv ~/.tmux.conf $backup_dir/ > /dev/null 2>&1
  echo "...done"
  echo "Creating symlink to new TMUX files"
  ln -s $dir/tmux/tmuxrc ~/.tmux.conf
  echo "...done"
fi

# INSTALL SCREEN DOTFILES
if command -v screen > /dev/null 2>&1
then
  echo "Backing up SCREEN files"
  mv ~/.screenrc $backup_dir/ > /dev/null 2>&1
  echo "...done"
  echo "Creating symlink to new SCREEN files"
  ln -s $dir/screen/screenrc ~/.screenrc
  echo "...done"
fi



########################################################
# install some more usefull enviroment tools
########################################################


# INSTALL PYTHON3
if command -v python3 > /dev/null 2>&1
then
  echo "Python 3 is already installed"
else
  echo "Installing Python 3"
  sudo apt install python3
  echo "...done"
fi

# INSTALL pip
if command -v pip > /dev/null 2>&1
then
  echo "pip is already installed"
else
  echo "Installing pip"
  sudo apt install python3-pip
  echo "...done"
fi


