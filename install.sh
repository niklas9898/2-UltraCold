#!/bin/bash -exu

export WORKSPACE=$PWD

rm -r /wang/users/niklas/cluster_home/2-UltraCold/build
rm /wang/users/niklas/cluster_home/2-UltraCold/source/base/bundled/arpack-ng-success.txt
rm -r /wang/users/niklas/cluster_home/2-UltraCold/source/base/bundled/arpack-ng/build

export LD_LIBRARY_PATH="/opt/spack_views/niklas/compilers_and_libraries_2020.4.304/linux/mkl/lib/intel64_lin:$LD_LIBRARY_PATH"
export LDFLAGS="-L/opt/spack_views/niklas/compilers_and_libraries_2020.4.304/linux/mkl/lib/intel64_lin -Wl,--no-as-needed -lmkl_intel_ilp64 -lmkl_gnu_thread -lmkl_core -lgomp -lpthread -lm -ldl"
export CFLAGS="-DMKL_ILP64  -m64"
#export CUDAFLAGS="-g"
export C_INCLUDE_PATH="/opt/spack_views/niklas/compilers_and_libraries_2020.4.304/linux/mkl/include:$C_INCLUDE_PATH"
export CPLUS_INCLUDE_PATH="/opt/spack_views/niklas/compilers_and_libraries_2020.4.304/linux/mkl/include:$CPLUS_INCLUDE_PATH"

export CUDA_LIBRARIES="/opt/spack_views/niklas/targets/x86_64-linux/lib:$CUDA_LIBRARIES"
export CUDA_INCLUDE_DIRS="/opt/spack_views/niklas/targets/x86_64-linux/include:$CUDA_INCLUDE_DIRS"

#export LD_LIBRARY_PATH="/opt/spack_views/niklas/targets/x86_64-linux/lib:$LD_LIBRARY_PATH"
#export LDFLAGS="-L$/opt/spack_views/niklas/targets/x86_64-linux/lib --linker-options -rpath"
#export LDFLAGS="-L/opt/spack_views/niklas/targets/x86_64-linux/lib -lcufft"

mkdir build
cd build

cmake -DULTRACOLD_WITH_CUDA=ON -DCMAKE_CUDA_ARCHITECTURES="all-major" -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DCMAKE_Fortran_COMPILER=gfortran -DCMAKE_INSTALL_PREFIX=. ..

make install

cd ..

