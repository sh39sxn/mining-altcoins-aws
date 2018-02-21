#!/bin/bash

apt-get update

# install cuda toolkit:
apt-get -y install g++ freeglut3-dev build-essential libx11-dev libxmu-dev libxi-dev libglu1-mesa libglu1-mesa-dev
apt-get -y install nvidia-cuda-toolkit
#run to see version: nvcc --version



# install cuda 8 for using ccminer-cryptonight, issues using cuda 9
wget -nc -O cuda-repo-ubuntu1604-8-0-local-ga2_8.0.61-1_amd64.deb https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda-repo-ubuntu1604-8-0-local-ga2_8.0.61-1_amd64-deb
dpkg -i cuda-repo-ubuntu1604-8-0-local-ga2_8.0.61-1_amd64.deb
apt-get -y install cuda-repo-ubuntu1604-8-0-local-ga2

# bug fixes package for cuda 8
wget -nc -O cuda-repo-ubuntu1604-8-0-local-cublas-performance-update_8.0.61-1_amd64.deb https://developer.nvidia.com/compute/cuda/8.0/Prod2/patches/2/cuda-repo-ubuntu1604-8-0-local-cublas-performance-update_8.0.61-1_amd64-deb
dpkg -i cuda-repo-ubuntu1604-8-0-local-cublas-performance-update_8.0.61-1_amd64.deb
apt-get -y install cuda-repo-ubuntu1604-8-0-local-cublas-performance-update

# export paths to CUDA libraries and executables
echo "export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64:\$LD_LIBRARY_PATH" >> /root/.bashrc
echo "export PATH=/usr/local/cuda-8.0/bin:\$PATH" >> /root/.bashrc

# install additional tools for ccminer
apt-get install -y git build-essential autotools-dev automake autoconf libssl-dev libcurl4-openssl-dev




# install ccminer
git clone https://github.com/tpruvot/ccminer
cd ccminer 


# This script was tested using Nvidia K520 (p2 instance type on AWS) which is a compute capability 3.0 device, so we have to change Arch Version for nvcc
# if you use a newer graphic card it probably supports higher capability levels, e.g. 5 or 6
# change Makefile.am, only activate Arch for Version 30 (3.0):

# comment all nvcc_ARCH lines
sed -e '/nvcc_ARCH +=/ s/^#*/#/' -i Makefile.am
# append nvcc_ARCH configuration for 3.0
sed '/nvcc_ARCH :=/a nvcc_ARCH += -gencode=arch=compute_30,code=\\"sm_30,compute_30\\"' -i Makefile.am


# build ccminer 
./autogen.sh
./configure
make
make install


# reboot in order to finish installation of cuda software
reboot