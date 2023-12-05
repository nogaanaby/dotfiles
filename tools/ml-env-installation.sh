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
  pip install tensorflow tensorflow-probability
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


# INSTALL KERAS
echo "Installing Keras"
if python3 -c "import keras" > /dev/null 2>&1
then
  echo "Keras is already installed"
else
  echo "Installing Keras"
  pip install keras
  echo "...done"
fi

# INSTALL scikit-learn (sklearn)
echo "Installing scikit-learn (sklearn)"
if python3 -c "import sklearn" > /dev/null 2>&1
then
  echo "scikit-learn (sklearn) is already installed"
else
  echo "Installing scikit-learn (sklearn)"
  pip install scikit-learn
  echo "...done"
fi