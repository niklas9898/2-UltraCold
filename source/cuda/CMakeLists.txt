#######################################################
# Configure and build cuda libraries for Ultracold
#######################################################




#-----------------------
# Create the library
#-----------------------


add_library(cudaSolvers
        STATIC
        ${CMAKE_SOURCE_DIR}/source/cuda/simple_kernels.cu
        ${CMAKE_SOURCE_DIR}/source/cuda/solver_kernels.cu
        ${CMAKE_SOURCE_DIR}/source/cuda/cudaGPSolver.cu
        ${CMAKE_SOURCE_DIR}/source/cuda/cudaDipolarGPSolver.cu
)

#----------------------------
# Set the include directories
#----------------------------

target_include_directories(cudaSolvers
        INTERFACE
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
        $<INSTALL_INTERFACE:include>
)

#---------------------------
# Link internal libraries
#---------------------------

target_link_libraries(cudaSolvers PUBLIC utilities)


find_package(Boost REQUIRED)
include_directories(${Boost_INCLUDE_DIRS})
target_link_libraries(cudaSolvers PUBLIC ${Boost_LIBRARIES})

message(STATUS "${Boost_FOUND}")
message(STATUS "${Boost_INCLUDE_DIRS}")


#--------------
# Find OpenMP
#--------------

find_package(OpenMP REQUIRED)
if (OPENMP_FOUND)
    set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${OpenMP_CXX_FLAGS}")
endif()
include_directories(SYSTEM ${OpenMP_CXX_INCLUDE_DIRS})
target_link_libraries(cudaSolvers PUBLIC OpenMP::OpenMP_CXX)
message(STATUS "Cudacode ${OPENMP_FOUND}")


#----------------------
# Link CUDA libraries
#----------------------

target_link_libraries(cudaSolvers PUBLIC "${CUDA_LIBRARIES}")

#---------------------------------------
# Allow CUDA to resolve its own symbols
#---------------------------------------

set_target_properties(cudaSolvers
        PROPERTIES
        CUDA_RESOLVE_DEVICE_SYMBOLS ON)

#-----------------------------------------------------------------
# Suppress generation of specific code for specific architecture
#-----------------------------------------------------------------

if(WHICH_CLUSTER STREQUAL "helix" OR WHICH_CLUSTER STREQUAL "justus")
    set_property(TARGET cudaSolvers
            PROPERTY CUDA_ARCHITECTURES
            OFF
    )
endif()



#---------------------------------------
# Enable separable compilation
#---------------------------------------

set_property(TARGET cudaSolvers
        PROPERTY
        CUDA_SEPARABLE_COMPILATION ON
)

#----------------------------------------------------
# Install libraries and files to the final location
#----------------------------------------------------

install(TARGETS cudaSolvers
        DESTINATION lib
        EXPORT UltraColdTargets
)


install(FILES cudaGPSolver.cuh DESTINATION include)
install(FILES cudaDipolarGPSolver.cuh DESTINATION include)
