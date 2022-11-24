import os
import subprocess
#os.system("sudo apt update")


def already_install(program_name,check_version): 
    result = subprocess.getoutput(check_version)
    print("this: ",result)
    not_found="not found"
    if(not_found in result):
        return False
    return True


def put_python3_in_PATH():
    profile_file=open("~.profile","a")
    profile_file.write("\nexport PATH=/usr/bin/Python3.8:$PATH" )
    profile_file.close()


#שימושית
def install_pip():
    if(not already_install("pip", "pip --version")):
        os.system("sudo apt install python3-pip")
        os.system("pip3 --version")
    else:
        print("you have pip\n")

def sounddevice():
    if(not already_install("sounddevice")):
        os.system("python3 -m pip install sounddevice --user")
        os.system("sounddevice --version")
    else:
        print("you have sounddevice\n")

def install_numpy():
    check_version='python3 -c "import numpy; print(numpy.__version__)"'
    result = subprocess.getoutput(check_version)
    print("this: ",result)
    not_found="No module named 'numpy'"
    if(not_found in result):
        os.system("pip3 install numpy")
    else:
        print("you probubly already have numpy\n")

def install_matplotlib():
    check_version="python3 -c 'import matplotlib; print(matplotlib.__version__, matplotlib.__file__)'"
    result = subprocess.getoutput(check_version)
    print("this: ",result)
    not_found="No module named"
    if(not_found in result):
        os.system("sudo apt-get install python3-matplotlib")
    else:
        print("you probubly already have matplotlib\n")
#install_numpy()
#put_python3_in_PATH()

install_matplotlib()



# install vscode

# vscode shortcut .code

# c++
# c
# cpp compiler
#cpp debuggerrrrrrrrrrrrrrrrr



# # ~/.profile: executed by the command interpreter for login shells.
# # This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# # exists.
# # see /usr/share/doc/bash/examples/startup-files for examples.
# # the files are located in the bash-doc package.

# # the default umask is set in /etc/profile; for setting the umask
# # for ssh logins, install and configure the libpam-umask package.
# #umask 022

# # if running bash
# if [ -n "$BASH_VERSION" ]; then
#     # include .bashrc if it exists
#     if [ -f "$HOME/.bashrc" ]; then
# 	. "$HOME/.bashrc"
#     fi
# fi

# # set PATH so it includes user's private bin if it exists
# if [ -d "$HOME/bin" ] ; then
#     PATH="$HOME/bin:$PATH"
# fi

# # set PATH so it includes user's private bin if it exists
# if [ -d "$HOME/.local/bin" ] ; then
#     PATH="$HOME/.local/bin:$PATH"
# fi