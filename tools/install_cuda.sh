
#!/bin/bash

# Check if CUDA is already installed
if command -v nvcc &> /dev/null; then
    echo "CUDA is already installed. Exiting."
    exit 0
fi

# Install dependencies
sudo apt-get install -y build-essential

# Download CUDA Toolkit
CUDA_VERSION="11.5"
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/11.5.0/local_installers/cuda-repo-ubuntu2004-11-5-local_11.5.0-450.51.06-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu2004-11-5-local_11.5.0-450.51.06-1_amd64.deb
sudo apt-key add /var/cuda-repo-ubuntu2004-11-5-local/7fa2af80.pub
sudo apt-get update
sudo apt-get -y install cuda

# Set environment variables
echo 'export PATH=/usr/local/cuda-'"$CUDA_VERSION"'/bin${PATH:+:${PATH}}' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda-'"$CUDA_VERSION"'/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}' >> ~/.bashrc

# Reboot the machine
sudo reboot
