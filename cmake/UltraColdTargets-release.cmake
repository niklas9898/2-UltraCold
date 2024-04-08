#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "solvers" for configuration "Release"
set_property(TARGET solvers APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(solvers PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libsolvers.a"
  )

list(APPEND _cmake_import_check_targets solvers )
list(APPEND _cmake_import_check_files_for_solvers "${_IMPORT_PREFIX}/lib/libsolvers.a" )

# Import target "utilities" for configuration "Release"
set_property(TARGET utilities APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(utilities PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libutilities.a"
  )

list(APPEND _cmake_import_check_targets utilities )
list(APPEND _cmake_import_check_files_for_utilities "${_IMPORT_PREFIX}/lib/libutilities.a" )

# Import target "cudaSolvers" for configuration "Release"
set_property(TARGET cudaSolvers APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(cudaSolvers PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CUDA"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libcudaSolvers.a"
  )

list(APPEND _cmake_import_check_targets cudaSolvers )
list(APPEND _cmake_import_check_files_for_cudaSolvers "${_IMPORT_PREFIX}/lib/libcudaSolvers.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
