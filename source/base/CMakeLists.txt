#-----------------------------------------------------------------
# Configure, build and install the bundled version of arpack-ng
#-----------------------------------------------------------------

set(ARPACK_DIR "${CMAKE_INSTALL_PREFIX}/base/bundled/arpack-ng")

if(WHICH_CLUSTER STREQUAL "helix" OR WHICH_CLUSTER STREQUAL "justus")
    execute_process(
        COMMAND ./configure_bundled_helix.sh ${ARPACK_DIR}
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/bundled
        RESULT_VARIABLE arpack-ng-success
    )
elseif(WHICH_CLUSTER STREQUAL "einc")
    execute_process(
        COMMAND ./configure_bundled_einc.sh ${ARPACK_DIR}
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/bundled
        RESULT_VARIABLE arpack-ng-success
    )
endif()


if(arpack-ng-success EQUAL "1")
    message(FATAL_ERROR
            "----------------------------------------------------------------------------\n"
            "There was an error while trying to build/test/install arpack-ng\n"
            "Such errors typically arise when environment variables for Intel's compilers "
            "or for MKL are not set correctly.\n"
            "Check these variables and try to re-run cmake.\n"
            "----------------------------------------------------------------------------\n")
endif()

# Add subdirectories

add_subdirectory(solvers)
add_subdirectory(utilities)
