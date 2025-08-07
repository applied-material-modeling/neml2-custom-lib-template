cmake_minimum_required(VERSION 3.26)
project(MyProject LANGUAGES CXX)

# First create your own library
add_library(mylib SHARED src/MyModel.cxx)
target_include_directories(mylib PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  $<INSTALL_INTERFACE:include>
)

# Find the neml2 package (which should have been installed)
#
# See CMake "Config Mode Search Procedure" for how you can control the search procedure
# https://cmake.org/cmake/help/latest/command/find_package.html#config-mode-search-procedure
#
# This will define imported targets like `neml2::neml2` that you can link against.
find_package(neml2 CONFIG)
target_link_libraries(mylib PRIVATE neml2::neml2)
