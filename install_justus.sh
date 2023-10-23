#!/bin/bash -exu

export WORKSPACE=$PWD

rm -r ${WORKSPACE}/build
rm ${WORKSPACE}/source/base/bundled/arpack-ng-success.txt
rm -r ${WORKSPACE}/source/base/bundled/arpack-ng/build

mkdir build
cd build

cmake -DULTRACOLD_WITH_CUDA=ON -DCMAKE_C_COMPILER=icc -DCMAKE_CXX_COMPILER=icpc -DCMAKE_Fortran_COMPILER=ifort -DWHICH_CLUSTER="justus" -DCMAKE_INSTALL_PREFIX=. ..

#-DCMAKE_CUDA_PTX_COMPILATION=OFF ..

make install

cd ..

