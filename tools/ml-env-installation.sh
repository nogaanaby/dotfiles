#!/usr/bin/env sh
# should I add cuda drivers? prime select? bitcoin git repo?#
dir=$1
backup_dir=$2

########################################################
# ML libraries
########################################################



# INSTALL TENSORFLOW, NUMPY, AND MATPLOTLIB
echo "Installing TensorFlow, NumPy, and Matplotlib"

# Check if TensorFlow is installed
if python3 -c "import tensorflow" > /dev/null 2>&1
then
  echo "TensorFlow is already installed"
else
  echo "Installing TensorFlow"
  pip install tensorflow
  echo "...done"
fi

# Check if NumPy is installed
if python3 -c "import numpy" > /dev/null 2>&1
then
  echo "NumPy is already installed"
else
  echo "Installing NumPy"
  pip install numpy
  echo "...done"
fi

if python3 -c "import pandas" > /dev/null 2>&1
then
  echo "Pandas is already installed"
else
  echo "Installing Pandas"
  pip install pandas
  echo "...done"
fi

# Check if Matplotlib is installed
if python3 -c "import matplotlib" > /dev/null 2>&1
then
  echo "Matplotlib is already installed"
else
  echo "Installing Matplotlib"
  pip install matplotlib
  echo "...done"
fi
