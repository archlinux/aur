# This toolchain file helps building a fully statically linked executable (besides DLLs from Windows itself) by
# defining certain variables. It is mainly focusing on dependencies used by Qt.

# build this on top of the regular toolchain file
include("/usr/share/mingw/toolchain-@TRIPLE@.cmake")

# prefer libraries from "static" sub-prefix
set(CMAKE_FIND_ROOT_PATH "/usr/@TRIPLE@/static;${CMAKE_FIND_ROOT_PATH}")

# prefer static libraries
# note: It is of no use to set the real variable CMAKE_FIND_LIBRARY_SUFFIXES here because it gets overridden by CMake
#       after loading the toolchain file. The project needs to make the actual override if enforcing static libraries
#       is required.
set(CMAKE_FIND_LIBRARY_SUFFIXES_OVERRIDE ".a;.lib")
set(CMAKE_EXE_LINKER_FLAGS "$ENV{LDFLAGS} -static -static-libgcc -static-libstdc++" CACHE STRING "linker flags for static builds" FORCE)
set(OPENSSL_USE_STATIC_LIBS ON)
set(BOOST_USE_STATIC_LIBS ON)

# force-use the shared Vulkan library because there's no static one
# note: The library is not used anyways but required for Vulkan to be considered installed and enabled.
set(Vulkan_LIBRARY "/usr/@TRIPLE@/lib/libvulkan.dll.a" CACHE FILEPATH "shared Vulkan IDC library")

# workaround limitations in upstream pkg-config files and CMake find modules
set(pkgcfg_lib_libbrotlicommon_brotlicommon "/usr/@TRIPLE@/lib/libbrotlicommon-static.a" CACHE INTERNAL "static libbrotlicommon")
set(pkgcfg_lib_libbrotlienc_brotlienc "/usr/@TRIPLE@/lib/libbrotlienc-static.a;/usr/@TRIPLE@/lib/libbrotlicommon-static.a" CACHE INTERNAL "static libbrotliend")
set(pkgcfg_lib_libbrotlidec_brotlidec "/usr/@TRIPLE@/lib/libbrotlidec-static.a;/usr/@TRIPLE@/lib/libbrotlicommon-static.a" CACHE INTERNAL "static libbrotlidec")
set(libbrotlicommon_STATIC_LDFLAGS "${pkgcfg_lib_libbrotlicommon_brotlicommon}" CACHE INTERNAL "static libbrotlicommon")
set(libbrotlienc_STATIC_LDFLAGS "${pkgcfg_lib_libbrotlienc_brotlienc}" CACHE INTERNAL "static libbrotliend")
set(libbrotlidec_STATIC_LDFLAGS "${pkgcfg_lib_libbrotlidec_brotlidec}" CACHE INTERNAL "static libbrotlidec")

# define dependencies of various static libraries as CMake doesn't pull them reliably automatically
# note: It would be possible to deduce the dependencies via pkg-config. However, for simplicity I'm hard-coding the dependencies for now.
#       In some cases the pkg-config file wouldn't work anyways because it is only covering the shared version (despite use of `-static`).
set(OPENSSL_DEPENDENCIES "-lws2_32;-lgdi32;-lcrypt32" CACHE INTERNAL "dependencies of static OpenSSL libraries")
set(POSTGRESQL_DEPENDENCIES "-lpgcommon;-lpgport;-lintl;-lssl;-lcrypto;-lshell32;-lws2_32;-lsecur32;-liconv" CACHE INTERNAL "dependencies of static PostgreSQL libraries")
set(MYSQL_DEPENDENCIES "-lssl;-lcrypto;-lshlwapi;-lgdi32;-lws2_32;-lpthread;-lz;-lm" CACHE INTERNAL "dependencies of static MySQL/MariaDB libraries")
set(LIBPNG_DEPENDENCIES "-lz" CACHE INTERNAL "dependencies of static libpng")
set(GLIB2_DEPENDENCIES "-lintl;-lws2_32;-lole32;-lwinmm;-lshlwapi;-lm" CACHE INTERNAL "dependencies of static Glib2")
set(FREETYPE_DEPENDENCIES "-lbz2;-lharfbuzz;-lfreetype;-lbrotlidec-static;-lbrotlicommon-static" CACHE INTERNAL "dependencies of static FreeType2 library")
set(HARFBUZZ_DEPENDENCIES "-lglib-2.0;${GLIB2_DEPENDENCIES};-lintl;-lm;-lfreetype;-lgraphite2" CACHE INTERNAL "dependencies of static HarfBuzz library")
set(DBUS1_DEPENDENCIES "-lws2_32;-liphlpapi;-ldbghelp" CACHE INTERNAL "dependencies of static D-Bus1 library")
