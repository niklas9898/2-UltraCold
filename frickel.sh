#!/bin/bash -exu

export LD_LIBRARY_PATH="/opt/spack_views/niklas/compilers_and_libraries_2020.4.304/linux/mkl/lib/intel64_lin:$LD_LIBRARY_PATH"
export LDFLAGS="-L/opt/spack_views/niklas/compilers_and_libraries_2020.4.304/linux/mkl/lib/intel64_lin -Wl,--no-as-needed -lmkl_intel_ilp64 -lmkl_gnu_thread -lmkl_core -lgomp -lpthread -lm -ldl"
export CFLAGS="-DMKL_ILP64  -m64"
export C_INCLUDE_PATH="/opt/spack_views/niklas/compilers_and_libraries_2020.4.304/linux/mkl/include:$C_INCLUDE_PATH"
export CPLUS_INCLUDE_PATH="/opt/spack_views/niklas/compilers_and_libraries_2020.4.304/linux/mkl/include:$CPLUS_INCLUDE_PATH"

cmake -DULTRACOLD_WITH_CUDA=on -DCMAKE_CUDA_ARCHITECTURES="all-major" -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DCMAKE_Fortran_COMPILER=gfortran -DULTRACOLD_DIR="${WORKSPACE}/build" -DCMAKE_INSTALL_PREFIX=. ..

make install
