# this file is written for mingw-w64-dlib package
#
# modified from CMakeLists.txt and cmake in this
# directory by pingplug<pingplug@foxmail.com>
#
# MAY NOT WORK IN OTHER LINUX DISTRIBUTIONS
#

# make macros that can add #define directives to the entire project.  Not just 
# to the dlib library itself.  I.e. to dlib and to any projects that depend
# on dlib.
macro ( add_global_define def_name )
   if (NOT CMAKE_CXX_FLAGS MATCHES "-D${def_name}")
      set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -D${def_name}" 
         CACHE STRING "Flags used by the compiler during all C++ builds." 
         FORCE)
   endif ()
endmacro()
macro ( remove_global_define def_name )
   if (CMAKE_CXX_FLAGS MATCHES " -D${def_name}")
      string (REGEX REPLACE " -D${def_name}" "" temp_var ${CMAKE_CXX_FLAGS}) 
      set (CMAKE_CXX_FLAGS "${temp_var}" 
         CACHE STRING "Flags used by the compiler during all C++ builds." 
         FORCE)
   endif ()
endmacro()


# Make sure ENABLE_ASSERTS is defined for debug builds
if (NOT CMAKE_CXX_FLAGS_DEBUG MATCHES "-DENABLE_ASSERTS")
   set (CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -DENABLE_ASSERTS" 
      CACHE STRING "Flags used by the compiler during C++ debug builds." 
      FORCE)
endif ()


# Don't add dlib if it's already been added to the cmake project
if (NOT TARGET dlib)

    set (USE_SYSTEM_DLIB_STR 
    "disable this if you want to compile dlib manually (i.e. you want a debug build of dlib)" )
    option(USE_SYSTEM_DLIB ${USE_SYSTEM_DLIB_STR} ON)

    # Determine the path to dlib.
    string(REGEX REPLACE "cmake$" "" dlib_path ${CMAKE_CURRENT_LIST_FILE})

    # By default, g++ won't warn or error if you forget to return a value in a
    # function which requires you to do so.  This option makes it give a warning
    # for doing this. 
    set(${CMAKE_CXX_FLAGS} "${CMAKE_CXX_FLAGS} -Wreturn-type")

    # Setup some options to allow a user to enable SSE and AVX instruction use.  
    option(USE_SSE2_INSTRUCTIONS "Compile your program with SSE2 instructions" OFF)
    option(USE_SSE4_INSTRUCTIONS "Compile your program with SSE4 instructions" OFF)
    option(USE_AVX_INSTRUCTIONS  "Compile your program with AVX instructions"  OFF)
    if(USE_AVX_INSTRUCTIONS)
        add_definitions(-mavx)
    elseif (USE_SSE4_INSTRUCTIONS)
        add_definitions(-msse4)
    elseif(USE_SSE2_INSTRUCTIONS)
        add_definitions(-msse2)
    endif()


    # Add folder containing dlib to the include search path.
    INCLUDE_DIRECTORIES(${dlib_path}/..)

    # This is really optional, but nice.  It will make sure the build mode 
    # created by cmake is always release by default.
    include(${dlib_path}/release_build_by_default)

    find_library(dlib_found dlib)
    if(dlib_found AND USE_SYSTEM_DLIB)
        set(USE_SYSTEM_DLIB ON)
        message("Use system dlib")
    else()
        set(USE_SYSTEM_DLIB OFF CACHE STRING ${USE_SYSTEM_DLIB_STR} FORCE)
        message("Build dlib manually")
        add_subdirectory(${dlib_path} dlib_build)
    endif()

endif()

if (NOT TARGET dlib)

    # Removed two debug options
    set (DLIB_ISO_CPP_ONLY_STR 
    "Enable this if you don't want to compile any non-ISO C++ code (i.e. you don't use any of the API Wrappers)" )
    set (DLIB_NO_GUI_SUPPORT_STR 
    "Enable this if you don't want to compile any of the dlib GUI code" )
    set (DLIB_USE_BLAS_STR
    "Disable this if you don't want to use a BLAS library" )
    set (DLIB_USE_LAPACK_STR
    "Disable this if you don't want to use a LAPACK library" )
    set (DLIB_LINK_WITH_LIBPNG_STR
    "Disable this if you don't want to link against libpng" )
    set (DLIB_LINK_WITH_LIBJPEG_STR
    "Disable this if you don't want to link against libjpeg" )
    set (DLIB_LINK_WITH_SQLITE3_STR
    "Disable this if you don't want to link against sqlite3" )
    #set (DLIB_LINK_WITH_FFTW_STR
    #"Disable this if you don't want to link against fftw" )

    option(DLIB_ISO_CPP_ONLY ${DLIB_ISO_CPP_ONLY_STR} OFF)
    option(DLIB_NO_GUI_SUPPORT ${DLIB_NO_GUI_SUPPORT_STR} OFF)
    option(DLIB_USE_BLAS ${DLIB_USE_BLAS_STR} ON)
    option(DLIB_USE_LAPACK ${DLIB_USE_LAPACK_STR} ON)
    option(DLIB_LINK_WITH_LIBPNG ${DLIB_LINK_WITH_LIBPNG_STR} ON)
    option(DLIB_LINK_WITH_LIBJPEG ${DLIB_LINK_WITH_LIBJPEG_STR} ON)
    option(DLIB_LINK_WITH_SQLITE3 ${DLIB_LINK_WITH_SQLITE3_STR} ON)
    #option(DLIB_LINK_WITH_FFTW ${DLIB_LINK_WITH_FFTW_STR} ON)


    # Removed check for headers
    if (NOT DLIB_ISO_CPP_ONLY)

        if (DLIB_NO_GUI_SUPPORT)
            set (dlib_needed_libraries " -lws2_32 ")
        else()
            set (dlib_needed_libraries " -lws2_32 -lcomctl32 -lgdi32 -limm32 ")
        endif()

        if (DLIB_LINK_WITH_LIBPNG)
            set(ZLIB_FIND_QUIETLY ON)
            set(PNG_FIND_QUIETLY ON)
            include(FindPNG)
            if (PNG_FOUND)
                set (dlib_needed_libraries "${dlib_needed_libraries} -lpng -lz ")
            else()
                set(DLIB_LINK_WITH_LIBPNG OFF CACHE STRING ${DLIB_LINK_WITH_LIBPNG_STR} FORCE )
            endif()
        endif()

        if (DLIB_LINK_WITH_LIBJPEG)
            include(FindJPEG)
            if (JPEG_FOUND)
                set (dlib_needed_libraries "${dlib_needed_libraries} -ljpeg ")
            else()
                set(DLIB_LINK_WITH_LIBJPEG OFF CACHE STRING ${DLIB_LINK_WITH_LIBJPEG_STR} FORCE )
            endif()
        endif()

        if (DLIB_USE_BLAS)
            find_library(blas_found cblas)
            if (blas_found)
                set (dlib_needed_libraries "${dlib_needed_libraries} -lcblas ")
            else()
                set(DLIB_USE_BLAS OFF CACHE STRING ${DLIB_USE_BLAS_STR} FORCE )
            endif()
        endif()

        if (DLIB_USE_LAPACK)
            find_library(lapack_found lapack)
            if (lapack_found)
                set (dlib_needed_libraries "${dlib_needed_libraries} -llapack ")
            else()
                set(DLIB_USE_LAPACK OFF CACHE STRING ${DLIB_USE_LAPACK_STR} FORCE )
            endif()
        endif()

        if (DLIB_LINK_WITH_SQLITE3)
            find_library(sqlite sqlite3)
            if (sqlite)
                set(dlib_needed_libraries "${dlib_needed_libraries} -lsqlite3 ")
            else()
                set(DLIB_LINK_WITH_SQLITE3 OFF CACHE STRING ${DLIB_LINK_WITH_SQLITE3_STR} FORCE )
            endif()
            mark_as_advanced(sqlite)
        endif()

        if (DLIB_LINK_WITH_FFTW)
            find_library(fftw fftw3)
            if (fftw)
                set(dlib_needed_libraries "${dlib_needed_libraries} -lfftw3 ")
            else()
                set(DLIB_LINK_WITH_FFTW OFF CACHE STRING ${DLIB_LINK_WITH_SQLITE3_STR} FORCE )
            endif()
            mark_as_advanced(fftw)
        endif()

        set(CMAKE_CXX_STANDARD_LIBRARIES "${CMAKE_CXX_STANDARD_LIBRARIES} ${dlib_needed_libraries}")

    endif ()  ##### end of if NOT DLIB_ISO_CPP_ONLY ##########################################################


    #test for some things that really should be true about the compiler
    include(TestForSTDNamespace)
    include(TestForANSIStreamHeaders)


    if (DLIB_LINK_WITH_LIBPNG AND NOT DLIB_ISO_CPP_ONLY)
        add_global_define(DLIB_PNG_SUPPORT)
    else()
        remove_global_define(DLIB_PNG_SUPPORT)
    endif()

    if (DLIB_LINK_WITH_LIBJPEG AND NOT DLIB_ISO_CPP_ONLY)
        add_global_define(DLIB_JPEG_SUPPORT)
    else()
        remove_global_define(DLIB_JPEG_SUPPORT)
    endif()

    if (DLIB_LINK_WITH_FFTW AND NOT DLIB_ISO_CPP_ONLY)
        add_global_define(DLIB_USE_FFTW)
    else()
        remove_global_define(DLIB_USE_FFTW)
    endif()

    if (DLIB_USE_BLAS AND blas_found)
        add_global_define(DLIB_USE_BLAS)
    else()
        remove_global_define(DLIB_USE_BLAS)
    endif()

    if (DLIB_USE_LAPACK AND lapack_found)
        add_global_define(DLIB_USE_LAPACK)
    else()
        remove_global_define(DLIB_USE_LAPACK)
    endif()

    if (DLIB_ISO_CPP_ONLY)
        add_global_define(DLIB_ISO_CPP_ONLY)
    else()
        remove_global_define(DLIB_ISO_CPP_ONLY)
    endif()

    if (DLIB_NO_GUI_SUPPORT)
        add_global_define(DLIB_NO_GUI_SUPPORT)
    else()
        remove_global_define(DLIB_NO_GUI_SUPPORT)
    endif()

    remove_global_define(DLIB_ENABLE_STACK_TRACE)
    remove_global_define(ENABLE_ASSERTS)

endif()

