#!/usr/bin/env sh


########## Variables

dir=~/.dotfiles                    # dotfiles directory
timestamp=`date +%s`               # use timestamp in backup dir names to keep
# track of backups
backup_dir=$dir/backup/$timestamp  # old dotfiles backup directory
##########

# Create Backup dir
mkdir -p $backup_dir
sudo apt update
sudo apt-get upgrade -y

# Backup directory with binaries
if [ -d ~/bin ]
then
  echo "Backing up old ~/bin directory"
  mv ~/bin $backup_dir/ > /dev/null 2>&1
fi

echo "Creating symlink to BIN directory"
ln -s $dir/bin ~/bin

# Create directory for local binaries which shouldn't be part of Repository
if [ ! -d ~/bin.local ]
then
  mkdir ~/bin.local
fi



sh ~/.dotfiles/tools/basic-installations.sh $dir $backup_dir


read -p "Do you want to install machine learning libraries (TensorFlow, NumPy, Pandas, Matplotlib)? (y/n): " install_ml_libraries

if [ "$install_ml_libraries" = "y" ]; then
  sh ~/.dotfiles/tools/ml-env-installation.sh $dir 
else
  echo "Skipping machine learning library installation." 
fi


read -p "Do you want to install cuda? (y/n): " install_cuda

if [ "$install_cuda" = "y" ]; then
  sh ~/.dotfiles/tools/install_cuda.sh $dir 
else
  echo "Skipping cuda installation." 
fi


# basic enviroment tools for eny mechine


echo "     _                  _ "
echo "  __| | ___  _ __   ___| |"
echo " / _  |/ _ \|  _ \ / _ \ |"
echo "| (_| | (_) | | | |  __/_|"
echo " \__,_|\___/|_| |_|\___(_)"
echo "                          "
