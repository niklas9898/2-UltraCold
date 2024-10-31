#!/bin/bash -exu

module getdefault Niklas

export WORKSPACE=/gpfs/bwfor/work/ws/hd_iw455-new_quasi2d/2-UltraCold

cmake -DCMAKE_BUILD_TYPE=Release -DWHICH_CLUSTER="helix" -DCMAKE_C_COMPILER=icc -DCMAKE_CXX_COMPILER=icpc -DCMAKE_Fortran_COMPILER=ifort -DULTRACOLD_DIR="${WORKSPACE}/build" ..

make
