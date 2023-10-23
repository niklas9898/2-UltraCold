#!/bin/bash -exu

cmake -DCMAKE_CUDA_ARCHITECTURES="all-major" -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DCMAKE_Fortran_COMPILER=gfortran -DCMAKE_BUILD_TYPE=Release -DULTRACOLD_DIR="${WORKSPACE}/build" ..

make
