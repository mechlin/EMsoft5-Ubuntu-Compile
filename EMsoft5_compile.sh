#!/bin/bash

apt-get update -y
apt-get upgrade -y
apt-get install build-essential git gcc gfortran cmake ocl-icd-opencl-dev libblas-dev liblapack-dev -y

cd /home/mechlin/Build

#EMsoft Superbuild
git clone https://github.com/EMsoft-org/EMsoftSuperbuild.git -b develop EMsoftSuperbuild5
cd EMsoftSuperbuild5
# mkdir Debug
# cd Debug
# cmake -DEMsoftOO_SDK=/home/mechlin/Build/EMsoftSuperbuildOO -DCMAKE_BUILD_TYPE=Debug ../
# make -j
# cd ../
mkdir Release
cd Release
cmake -DEMsoft_SDK=/home/mechlin/Build/EMsoftSuperbuild5/ -DCMAKE_BUILD_TYPE=Release ../
make -j

cd /home/mechlin/Build 
 
#EMsoftOO Build
git clone https://github.com/EMsoft-org/EMsoft.git -b develop EMsoft5
mkdir EMsoft5Build
cd EMsoft5Build
mkdir Release
cd Release
cmake -DCMAKE_BUILD_TYPE=Release -DEMsoft_SDK=/home/mechlin/Build/EMsoftSuperbuild5/ ../../EMsoft5
make
#cd ../
#mkdir Debug
#cd Debug
#cmake -DCMAKE_BUILD_TYPE=Debug -DEMsoftOO_SDK=/home/mechlin/Build/EMsoftSuperbuildOO/ ../../EMsoftOO
#make -j
 