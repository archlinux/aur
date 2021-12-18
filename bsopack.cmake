cmake_minimum_required(VERSION 2.8.11)
PROJECT(sqpack C)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

option(BUILD_SHARED_LIBS "Build shared libs" ON)

if(CMAKE_BUILD_TYPE MATCHES Debug)
  ADD_DEFINITIONS(-g -DDEBUG -D_DEBUG)
  set(CMAKE_CONFIGURATION_TYPES "Debug" CACHE STRING "My multi config types" FORCE)
else(CMAKE_BUILD_TYPE MATCHES Debug)
  ADD_DEFINITIONS(-DNDEBUG)
  set(CMAKE_CONFIGURATION_TYPES "Release" CACHE STRING "My multi config types" FORCE)
endif(CMAKE_BUILD_TYPE MATCHES Debug)

if (MSVC)
  if (BUILD_SHARED_LIBS)
    ADD_DEFINITIONS(-D_DLL -D_MAKE_DLL)
  else()
    set(CompilerFlags
      CMAKE_CXX_FLAGS
      CMAKE_CXX_FLAGS_DEBUG
      CMAKE_CXX_FLAGS_RELEASE
      CMAKE_C_FLAGS
      CMAKE_C_FLAGS_DEBUG
      CMAKE_C_FLAGS_RELEASE
    )
    foreach(CompilerFlag ${CompilerFlags})
      string(REPLACE "/MD" "/MT" ${CompilerFlag} "${${CompilerFlag}}")
    endforeach()
  endif()
  set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/../out/lib")
  set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/../out/bin")
  ADD_DEFINITIONS(-DWIN32 -D_WINDOWS -D_CONSOLE -D_CRT_SECURE_NO_WARNINGS)
  include_directories("${CMAKE_CURRENT_SOURCE_DIR};${CMAKE_CURRENT_SOURCE_DIR}/../huskylib;${CMAKE_CURRENT_SOURCE_DIR}/../fidoconf;${CMAKE_CURRENT_SOURCE_DIR}/../smapi;")
  if(CMAKE_BUILD_TYPE MATCHES Debug)
    list( APPEND CMAKE_FIND_ROOT_PATH "${CMAKE_CURRENT_SOURCE_DIR}/../out/lib/Debug" )
  else(CMAKE_BUILD_TYPE MATCHES Debug)
    list( APPEND CMAKE_FIND_ROOT_PATH "${CMAKE_CURRENT_SOURCE_DIR}/../out/lib/Release" )
  endif(CMAKE_BUILD_TYPE MATCHES Debug)
else ()
  if (NOT BUILD_SHARED_LIBS)
    SET(CMAKE_FIND_LIBRARY_SUFFIXES ".a")
  endif()
  include_directories("${CMAKE_CURRENT_SOURCE_DIR};${CMAKE_CURRENT_SOURCE_DIR}/h;${CMAKE_CURRENT_SOURCE_DIR}/../huskylib;${CMAKE_CURRENT_SOURCE_DIR}/../fidoconf;${CMAKE_CURRENT_SOURCE_DIR}/../smapi;")
  ADD_DEFINITIONS(-Wall -DUNIX)
endif (MSVC)

find_library(husky_LIB NAMES husky PATHS "${CMAKE_FIND_ROOT_PATH}")
find_library(fidoconfig_LIB NAMES fidoconfig PATHS "${CMAKE_FIND_ROOT_PATH}")
find_library(smapi_LIB NAMES smapi PATHS "${CMAKE_FIND_ROOT_PATH}")

message("-------------------------")
message("System            : ${CMAKE_SYSTEM_NAME} ${CMAKE_SYSTEM_VERSION}")
message("Compiler          : ${CMAKE_C_COMPILER_ID} ${CMAKE_C_COMPILER_VERSION}")
message("Prefix            : ${CMAKE_INSTALL_PREFIX} (run \"cmake . -DCMAKE_INSTALL_PREFIX:PATH=/other\" for other prefix)")
message("libhusky          : ${husky_LIB}")
message("libfidoconfig     : ${fidoconfig_LIB}")
message("libsmapi          : ${smapi_LIB}")
message("Build shared      : ${BUILD_SHARED_LIBS}")
message("Build type        : ${CMAKE_CONFIGURATION_TYPES}")
message("-------------------------")

ADD_EXECUTABLE(bsopack
  src/config.c src/bsoutil.c src/bsopack.c
)
target_link_libraries(bsopack ${fidoconfig_LIB} ${smapi_LIB} ${husky_LIB})

  INSTALL(TARGETS bsopack
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
  )
if (NOT MSVC)
  set(CPACK_GENERATOR ${CPACK_GENERATOR} TGZ)
else()
  set(CPACK_GENERATOR ${CPACK_GENERATOR} 7Z)
endif (NOT MSVC)

set (CPACK_STRIP_FILES TRUE)
set (CPACK_PACKAGE_VERSION_MAJOR "1")
set (CPACK_PACKAGE_VERSION_MINOR "9")
file(READ cvsdate.h CPACK_PACKAGE_VERSION_PATCH LIMIT 10 OFFSET 17)
string(SUBSTRING ${CPACK_PACKAGE_VERSION_PATCH} 0 10 CPACK_PACKAGE_VERSION_PATCH)
string(REGEX REPLACE "-" "" CPACK_PACKAGE_VERSION_PATCH ${CPACK_PACKAGE_VERSION_PATCH})
set (CPACK_DEBIAN_PACKAGE_SHLIBDEPS TRUE)
INCLUDE(CPack)
