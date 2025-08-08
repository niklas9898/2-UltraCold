#!/bin/bash -exu

#module restore gnu_niklas
module restore Niklas

export WORKSPACE=/gpfs/bwfor/work/ws/hd_iw455-quasi2d/2-UltraCold

cmake -DCMAKE_BUILD_TYPE=Release -DWHICH_CLUSTER="helix" -DCMAKE_C_COMPILER=icc -DCMAKE_CXX_COMPILER=icpc -DCMAKE_CUDA_HOST_COMPILER=$(which icpc) -DCMAKE_Fortran_COMPILER=ifort -DULTRACOLD_DIR="${WORKSPACE}/build" ..

# use einc configuration to compile with gnu

# export LD_LIBRARY_PATH="/opt/bwhpc/common/compiler/intel/2022.2/mkl/2022.1.0/lib/intel64:$LD_LIBRARY_PATH"
# export LDFLAGS="-L/opt/bwhpc/common/compiler/intel/2022.2/mkl/2022.1.0/lib/intel64 -Wl,--no-as-needed -lmkl_intel_ilp64 -lmkl_gnu_thread -lmkl_core -lgomp -lpthread -lm -ldl"
# export CFLAGS="-DMKL_ILP64 -m64"
# export CXXFLAGS="-DMKL_ILP64 -m64"
# export C_INCLUDE_PATH="/opt/bwhpc/common/compiler/intel/2022.2/mkl/2022.1.0/include:$C_INCLUDE_PATH"
# export CPLUS_INCLUDE_PATH="/opt/bwhpc/common/compiler/intel/2022.2/mkl/2022.1.0/include:$CPLUS_INCLUDE_PATH"


#cmake -DWHICH_CLUSTER="einc" -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DCMAKE_Fortran_COMPILER=gfortran -DCMAKE_BUILD_TYPE=Release -DULTRACOLD_DIR="${WORKSPACE}/build" ..

make
