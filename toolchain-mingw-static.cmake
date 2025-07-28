# This toolchain file helps building a fully statically linked executable (besides DLLs from Windows itself) by
# defining certain variables. It is mainly focusing on dependencies used by Qt.

# build this on top of the regular toolchain file
include("/usr/share/mingw/toolchain-@TRIPLE@.cmake")

# prefer libraries from "static" sub-prefix
set(CMAKE_STATIC_PREFIX "/usr/@TRIPLE@/static")
set(CMAKE_FIND_ROOT_PATH "${CMAKE_STATIC_PREFIX};${CMAKE_FIND_ROOT_PATH}")

# prefer static libraries
# note: It is of no use to set the real variable CMAKE_FIND_LIBRARY_SUFFIXES here because it gets overridden by CMake
#       after loading the toolchain file. The project needs to make the actual override if enforcing static libraries
#       is required.
set(CMAKE_FIND_LIBRARY_SUFFIXES_OVERRIDE ".a;.lib")
set(CMAKE_EXE_LINKER_FLAGS "$ENV{LDFLAGS} @EXE_LINKER_FLAGS@" CACHE STRING "linker flags for static builds" FORCE)
set(OPENSSL_USE_STATIC_LIBS ON)
set(BOOST_USE_STATIC_LIBS ON)

# force-use the shared Vulkan library because there's no static one
# note: The library is not used anyways but required for Vulkan to be considered installed and enabled.
set(Vulkan_LIBRARY "/usr/@TRIPLE@/lib/libvulkan.dll.a" CACHE FILEPATH "shared Vulkan IDC library")

# workaround limitations in upstream pkg-config files and CMake find modules
set(SQLite3_LIBRARY "${CMAKE_STATIC_PREFIX}/lib/libsqlite3.a" CACHE FILEPATH "static sqlite3")
set(pkgcfg_lib_PC_SQLite3_sqlite3 "${SQLite3_LIBRARY}" CACHE FILEPATH "static sqlite3")
set(pkgcfg_lib_libbrotlicommon_brotlicommon "${CMAKE_STATIC_PREFIX}/lib/libbrotlicommon.a" CACHE INTERNAL "static libbrotlicommon")
set(pkgcfg_lib_libbrotlienc_brotlienc "${CMAKE_STATIC_PREFIX}/lib/libbrotlienc.a;${CMAKE_STATIC_PREFIX}/lib/libbrotlicommon.a" CACHE INTERNAL "static libbrotliend")
set(pkgcfg_lib_libbrotlidec_brotlidec "${CMAKE_STATIC_PREFIX}/lib/libbrotlidec.a;${CMAKE_STATIC_PREFIX}/lib/libbrotlicommon.a" CACHE INTERNAL "static libbrotlidec")
set(libbrotlicommon_STATIC_LDFLAGS "${pkgcfg_lib_libbrotlicommon_brotlicommon}" CACHE INTERNAL "static libbrotlicommon")
set(libbrotlienc_STATIC_LDFLAGS "${pkgcfg_lib_libbrotlienc_brotlienc}" CACHE INTERNAL "static libbrotliend")
set(libbrotlidec_STATIC_LDFLAGS "${pkgcfg_lib_libbrotlidec_brotlidec}" CACHE INTERNAL "static libbrotlidec")

# disable use of find modules that don't work for static libraries
set(CMAKE_DISABLE_FIND_PACKAGE_harfbuzz TRUE)

# define dependencies of various static libraries as CMake doesn't pull them reliably automatically
# note: It would be possible to deduce the dependencies via pkg-config. However, for simplicity I'm hard-coding the dependencies for now.
#       In some cases the pkg-config file wouldn't work anyways because it is only covering the shared version (despite use of `-static`).
option(USE_LINK_GROUP "use LINK_GROUP" ON)
set(OPENSSL_DEPENDENCIES "-lws2_32;-lgdi32;-lcrypt32" CACHE INTERNAL "dependencies of static OpenSSL libraries")
set(POSTGRESQL_DEPENDENCIES "-lpgcommon;-lpgport;-lintl;-lssl;-lcrypto;-lshell32;-lws2_32;-lsecur32;-liconv" CACHE INTERNAL "dependencies of static PostgreSQL libraries")
set(MYSQL_DEPENDENCIES "-lzstd;-lshlwapi;-lgdi32;-lws2_32;-lbcrypt;-lcrypt32;-lsecur32;-ladvapi32;-lpthread;-lz;-lm" CACHE INTERNAL "dependencies of static MySQL/MariaDB libraries")
set(LIBPNG_DEPENDENCIES "-lz" CACHE INTERNAL "dependencies of static libpng")
set(GLIB2_DEPENDENCIES "-lintl;-lws2_32;-lole32;-lwinmm;-lshlwapi;-lm" CACHE INTERNAL "dependencies of static Glib2")
set(FREETYPE_DEP_LIBS "-lbz2;-lharfbuzz;-lfreetype;-lbrotlidec;-lbrotlicommon")
set(HARFBUZZ_DEP_LIBS "-lglib-2.0;${GLIB2_DEPENDENCIES};-lintl;-lm;-lfreetype;-lgraphite2" CACHE INTERNAL "dependencies of static HarfBuzz library")
if (USE_LINK_GROUP)
    set(FREETYPE_DEPENDENCIES "$<LINK_GROUP:RESCAN,${FREETYPE_DEP_LIBS}>" CACHE INTERNAL "dependencies of static FreeType2 library")
    set(HARFBUZZ_DEPENDENCIES "$<LINK_GROUP:RESCAN,${HARFBUZZ_DEP_LIBS}>" CACHE INTERNAL "dependencies of static HarfBuzz library")
else ()
    set(FREETYPE_DEPENDENCIES "${FREETYPE_DEP_LIBS}" CACHE INTERNAL "dependencies of static FreeType2 library")
    set(HARFBUZZ_DEPENDENCIES "${HARFBUZZ_DEP_LIBS}" CACHE INTERNAL "dependencies of static HarfBuzz library")
endif ()
set(DBUS1_DEPENDENCIES "-lws2_32;-liphlpapi;-ldbghelp" CACHE INTERNAL "dependencies of static D-Bus1 library")
