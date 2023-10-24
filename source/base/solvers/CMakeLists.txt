##################################################################################
# Build a library containing all solver classes based on Intel's MKL 
##################################################################################

cmake_minimum_required(VERSION 3.10)

#--------------
# Find OpenMP
#--------------

find_package(OpenMP REQUIRED)

#-------------------
# Find arpack-ng
#-------------------

find_package(arpack-ng REQUIRED HINTS ${ARPACK_DIR} $ENV{ARPACK_DIR})

#-------------------------------
# Create the solvers library
#-------------------------------

add_library(solvers
    STATIC
    ${CMAKE_SOURCE_DIR}/source/base/solvers/GPSolver.cpp
    ${CMAKE_SOURCE_DIR}/source/base/solvers/BogolyubovSolver.cpp
    ${CMAKE_SOURCE_DIR}/source/base/solvers/DipolarBogolyubovSolver.cpp
    ${CMAKE_SOURCE_DIR}/source/base/solvers/DipolarGPSolver.cpp
)

#-------------------------------
# Set the include directories
#-------------------------------

target_include_directories(solvers
    INTERFACE
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
    $<INSTALL_INTERFACE:include>
)

#------------------------------------
# Link additional internal libraries
#------------------------------------

if(OpenMP_FOUND)
    target_link_libraries(solvers utilities OpenMP::OpenMP_CXX)
else()
    target_link_libraries(solvers utilities)
endif()

#---------------------
# Link to arpack-ng
#---------------------

target_include_directories(solvers PUBLIC ${ARPACK_DIR}/include/arpack)
target_link_directories(solvers PUBLIC ${ARPACK_DIR}/lib)
target_link_libraries(solvers ARPACK::ARPACK)

#-------------------------------------------------------
# Install library and headers to their final location
#-------------------------------------------------------

install(TARGETS solvers
        DESTINATION lib
        EXPORT UltraColdTargets
)

install(FILES GPSolvers.hpp DESTINATION include)
install(FILES BogolyubovSolvers.hpp DESTINATION include)
