#
# PKGBUILD for codelite-unstable
#
# codelite-unstable package follows the weekly/latest builds of codelite - based on officially published tags
#
# The naming codelite-unstable is deliberately used to indicate that this package is not based the official stable release
#
# Maintainer: Uffe Jakobsen <uffe@uffe.org>
#
# ReleaseNotes: https://docs.codelite.org/release_notes/v18_0_0/
#
# NOTES:
#
#

#
_pkg_user="eranif"
_pkg_name="codelite"
_pkg_ver="18.3.0"
#_commit="bf6820c7c8bece16c857f5a992aff23ac4ddc1ee"

# pkg
pkgname="${_pkg_name}-unstable"
#pkgver=${_pkg_ver}
#pkgver="${_pkg_ver//_/-}"
pkgver="${_pkg_ver/-*/}"
pkgrel=1

# generic: pre
_pkg_ver="${pkgver}"

# use version
_pkg_ident="${pkgver}"

# use commit
#_pkg_ident="${_commit}"

# generic: post
_pkg_name_ver="${_pkg_name}-${_pkg_ident}"
_pkg_name_ident="${_pkg_name}-${_pkg_ident}"


_pkg_src_res="${_pkg_name_ident}.tar.gz::https://github.com/${_pkg_user}/${_pkg_name}/archive/${_pkg_ident}.tar.gz"

#
# submodules
#

# a78d4f1469890eb4e795709848ebf57b002ad369 submodules/LuaBridge (heads/master)
# d2eb8e1e40c5a78909f698a2d12c4f146c2976ba submodules/assistant (remotes/origin/HEAD)
# fd1ac4f1791b403af1f7350b1195ac114f9b792b submodules/cJSON (v0.0.0~50^2^2~16)
# 53464674ff2c287dfd68f05030d1d79e02d4974c submodules/cc-wrapper (remotes/origin/HEAD)
# ac5c942b422ca6dc6cdbfd2a0c2d481af1f18f02 submodules/ctags (p6.1.20240728.0-2-gac5c942b4)
# 1da23a3e8119ec5cce4f9388e91b065e20bf06f5 submodules/doctest (v2.4.12)
# 32567bb9ec704f09040fb1ed7431a3d967e3df03 submodules/dtl (v1.21)
# 1d9a9ca8841ac0cd591c95b162301d2502641901 submodules/hunspell (v1.7.2-92-g1d9a9ca)
# 8502988a5eb83fcd281ee5a38533a9f170e6b2bf submodules/lexilla (remotes/origin/HEAD)
# 854795c654eda518ed6de6c1ebb4e2107fcb2e73 submodules/libssh (libssh-0.11.1)
# bb8dc5ff01cf725dff2a8dcfe08fb0b81a9a7729 submodules/lua (heads/master)
# 7042229f977ca801983116593b2bbd73ae7f2657 submodules/openssl-cmake (heads/v3)
# 8bb3ad01d5cbdef8d8f749d85df9fcd24d90923c submodules/wx-config-msys2 (remotes/origin/HEAD)
# e390b824ba0ab29e7665229f84f9fa44e8bef468 submodules/wxdap (remotes/origin/HEAD)
# 2f86d13775d119edbb69af52e5f566fd65c6953b submodules/yaml-cpp (0.8.0-74-g2f86d13)
# 0f51fb4933fc9ce18199cb2554dacea8033e7fd3 submodules/zlib (v1.3.1-50-g0f51fb4)

# NOTE: these submodules are currenly only used by macos builds - ignore them for now:
#   submodules/hunspell,
#   submodules/libssh
#   submodules/openssl-cmake
#   submodules/zlib

_luabridge_pkg_user="${_pkg_user}"
_luabridge_pkg_name="LuaBridge"
_luabridge_pkg_ident="a78d4f1469890eb4e795709848ebf57b002ad369"
_luabridge_pkg_name_ident="${_luabridge_pkg_user}-${_luabridge_pkg_name}-${_luabridge_pkg_ident:0:7}"
_luabridge_pkg_src_res="${_luabridge_pkg_name_ident}.tar.gz::https://github.com/${_luabridge_pkg_user}/${_luabridge_pkg_name}/tarball/${_luabridge_pkg_ident}"

# assistant submodule: ssh://github.com/eraniff/codelite-assistant.git
_assistant_pkg_user="${_pkg_user}"
_assistant_pkg_name="assistant"
_assistant_pkg_ident="d2eb8e1e40c5a78909f698a2d12c4f146c2976ba"
_assistant_pkg_name_ident="${_assistant_pkg_user}-${_assistant_pkg_name}-${_assistant_pkg_ident:0:7}"
_assistant_pkg_src_res="${_assistant_pkg_name_ident}.tar.gz::https://github.com/${_assistant_pkg_user}/${_assistant_pkg_name}/tarball/${_assistant_pkg_ident}"

# cjson submodule: https://github.com/DaveGamble/cJSON
_cjson_pkg_user="DaveGamble"
_cjson_pkg_name="cJSON"
_cjson_pkg_ident="fd1ac4f1791b403af1f7350b1195ac114f9b792b"
_cjson_pkg_name_ident="${_cjson_pkg_user}-${_cjson_pkg_name}-${_cjson_pkg_ident:0:7}"
_cjson_pkg_src_res="${_cjson_pkg_name_ident}.tar.gz::https://github.com/${_cjson_pkg_user}/${_cjson_pkg_name}/tarball/${_cjson_pkg_ident}"

# ccwrap submodule: https://github.com/eranif/cc-wrapper
_ccwrap_pkg_user="${_pkg_user}"
_ccwrap_pkg_name="cc-wrapper"
_ccwrap_pkg_ident="53464674ff2c287dfd68f05030d1d79e02d4974c"
_ccwrap_pkg_name_ident="${_ccwrap_pkg_user}-${_ccwrap_pkg_name}-${_ccwrap_pkg_ident:0:7}"
_ccwrap_pkg_src_res="${_ccwrap_pkg_name_ident}.tar.gz::https://github.com/${_ccwrap_pkg_user}/${_ccwrap_pkg_name}/tarball/${_ccwrap_pkg_ident}"

# ctags submodule: https://github.com/eranif/ctags
_ctags_pkg_user="${_pkg_user}"
_ctags_pkg_name="ctags"
_ctags_pkg_ident="ac5c942b422ca6dc6cdbfd2a0c2d481af1f18f02"
_ctags_pkg_name_ident="${_ctags_pkg_user}-${_ctags_pkg_name}-${_ctags_pkg_ident:0:7}"
_ctags_pkg_src_res="${_ctags_pkg_name_ident}.tar.gz::https://github.com/${_ctags_pkg_user}/${_ctags_pkg_name}/tarball/${_ctags_pkg_ident}"

# doctest submodule: https://github.com/doctest/doctest
_doctest_pkg_user="doctest"
_doctest_pkg_name="doctest"
_doctest_pkg_ident="32567bb9ec704f09040fb1ed7431a3d967e3df03"
_doctest_pkg_name_ident="${_doctest_pkg_user}-${_doctest_pkg_name}-${_doctest_pkg_ident:0:7}"
_doctest_pkg_src_res="${_doctest_pkg_name_ident}.tar.gz::https://github.com/${_doctest_pkg_user}/${_doctest_pkg_name}/tarball/${_doctest_pkg_ident}"

# dtl submodule: https://github.com/cubicdaiya/dtl
_dtl_pkg_user="cubicdaiya"
_dtl_pkg_name="dtl"
_dtl_pkg_ident="32567bb9ec704f09040fb1ed7431a3d967e3df03"
_dtl_pkg_name_ident="${_dtl_pkg_user}-${_dtl_pkg_name}-${_dtl_pkg_ident:0:7}"
_dtl_pkg_src_res="${_dtl_pkg_name_ident}.tar.gz::https://github.com/${_dtl_pkg_user}/${_dtl_pkg_name}/tarball/${_dtl_pkg_ident}"

# lexilla submodule: https://github.com/eranif/lexilla.git
_lexilla_pkg_user="eranif"
_lexilla_pkg_name="lexilla"
_lexilla_pkg_ident="8502988a5eb83fcd281ee5a38533a9f170e6b2bf"
_lexilla_pkg_name_ident="${_lexilla_pkg_user}-${_lexilla_pkg_name}-${_lexilla_pkg_ident:0:7}"
_lexilla_pkg_src_res="${_lexilla_pkg_name_ident}.tar.gz::https://github.com/${_lexilla_pkg_user}/${_lexilla_pkg_name}/tarball/${_lexilla_pkg_ident}"

# lua submodule: https://github.com/eranif/lua.git
_lua_pkg_user="${_pkg_user}"
_lua_pkg_name="lua"
_lua_pkg_ident="bb8dc5ff01cf725dff2a8dcfe08fb0b81a9a7729"
_lua_pkg_name_ident="${_lua_pkg_user}-${_lua_pkg_name}-${_lua_pkg_ident:0:7}"
_lua_pkg_src_res="${_lua_pkg_name_ident}.tar.gz::https://github.com/${_lua_pkg_user}/${_lua_pkg_name}/tarball/${_lua_pkg_ident}"

# wxcfg/wx-config-msys2s submodule: https://github.com/eranif/wx-config-msys2.git
_wxcfg_pkg_user="${_pkg_user}"
_wxcfg_pkg_name="wx-config-msys2"
_wxcfg_pkg_ident="8bb3ad01d5cbdef8d8f749d85df9fcd24d90923c"
_wxcfg_pkg_name_ident="${_wxcfg_pkg_user}-${_wxcfg_pkg_name}-${_wxcfg_pkg_ident:0:7}"
_wxcfg_pkg_pkg_res="${_wxcfg_pkg_name_ident}.tar.gz::https://github.com/${_wxcfg_pkg_user}/${_wxcfg_pkg_name}/tarball/${_wxcfg_pkg_ident}"

# wxdap/wxdap submodule: https://github.com/eranif/wxdap
_wxdap_pkg_user="${_pkg_user}"
_wxdap_pkg_name="wxdap"
_wxdap_pkg_ident="e390b824ba0ab29e7665229f84f9fa44e8bef468"
_wxdap_pkg_name_ident="${_wxdap_pkg_user}-${_wxdap_pkg_name}-${_wxdap_pkg_ident:0:7}"
_wxdap_pkg_src_res="${_wxdap_pkg_name_ident}.tar.gz::https://github.com/${_wxdap_pkg_user}/${_wxdap_pkg_name}/tarball/${_wxdap_pkg_ident}"

# yaml-cpp submodule: https://github.com/jbeder/yaml-cpp
_yaml_pkg_user="jbeder"
_yaml_pkg_name="yaml-cpp"
_yaml_pkg_ident="2f86d13775d119edbb69af52e5f566fd65c6953b"
_yaml_pkg_name_ident="${_yaml_pkg_user}-${_yaml_pkg_name}-${_yaml_pkg_ident:0:7}"
_yaml_pkg_src_res="${_yaml_pkg_name_ident}.tar.gz::https://github.com/${_yaml_pkg_user}/${_yaml_pkg_name}/tarball/${_yaml_pkg_ident}"

#
# sub-sub-modules
#

# tinyjson (cc-wrapper) sub-submodule: https://github.com/eranif/tinyjson
_ccwrap_tinyjson_pkg_user="${_pkg_user}"
_ccwrap_tinyjson_pkg_name="tinyjson"
_ccwrap_tinyjson_pkg_ident="d51ef6fc646d60c1400ebde767ebfdd2b7361482"
_ccwrap_tinyjson_pkg_name_ident="${_ccwrap_tinyjson_pkg_user}-${_ccwrap_tinyjson_pkg_name}-${_ccwrap_tinyjson_pkg_ident:0:7}"
_ccwrap_tinyjson_pkg_src_res="${_ccwrap_tinyjson_pkg_name_ident}.tar.gz::https://github.com/${_ccwrap_tinyjson_pkg_user}/${_ccwrap_tinyjson_pkg_name}/tarball/${_ccwrap_tinyjson_pkg_ident}"

#
#
#
pkgdesc="Cross platform IDE for C, C++, Rust, Python, PHP and Node.js written in C++"
arch=('i686' 'x86_64' 'aarch64')
url="https://codelite.org/"
license=("GPL-2.0-or-later")

makedepends=('pkgconfig' 'cmake' 'ninja' 'clang')

depends=(
    'wxwidgets-gtk3'
    'wxwidgets-common'
    'libedit'
    'libssh'
    'mariadb-libs'
    'ncurses'
    'uchardet'
    'hunspell'
    'glibc'
    'libstdc++'
    'libgcc'
    'glib2'
    'python'
    'openssl'
    'sqlite'
    #'ctags'
    #'xterm'
    #'wget'
    #'curl'
)

optdepends=(
    'clang: compiler'
    'lldb: debugger'
    'gcc: compiler'
    'gdb: debugger'
    'valgrind: debugger'
    'rust: language'
    'php: language'
    'graphviz: callgraph visualization'
    'cscope: CScope Integration for CodeLite'
)

provides=('codelite')

conflicts=('codelite')

source=(
    "${_pkg_src_res}"
    "${_luabridge_pkg_src_res}"
    "${_assistant_pkg_src_res}"
    "${_ccwrap_pkg_src_res}"
    "${_cjson_pkg_src_res}"
    "${_ctags_pkg_src_res}"
    #"${_doctest_pkg_src_res}"
    "${_dtl_pkg_src_res}"
    "${_lexilla_pkg_src_res}"
    "${_lua_pkg_src_res}"
    "${_wxcfg_pkg_pkg_res}"
    "${_wxdap_pkg_src_res}"
    "${_yaml_pkg_src_res}"
    "${_ccwrap_tinyjson_pkg_src_res}"
    "http://repos.codelite.org/wxCrafterLibs/wxgui.zip"
  )

sha256sums=('d49e504edac70d41d149eb4f20e53219dcd5fc72d3979c6591b18e92a0f5627d'
            '1cb22a33ddacbafa9b3526e248b9abfed098d87bcbbd793774af2e816c6eb94e'
            'cd1b525cfecf8dcbafa8bf1d1244ff2c5f61ea30d3668fcb239fdd985b1c5204'
            'fa90de0cadd10d875af9fc08142a46079fc024ba5afebb23fa1a966807980dc8'
            '70518c1b8203359c19b0313e05639568d8089cf9ffa9c9784970fdd69ab6eaad'
            'b9277072988a8318e7b2fec411c915eee0838dd05564d10e9e9381617458dd30'
            'baea37f9af8663240b56b634fd6e3ebd464f6b31f8ff520fc46b2ec8a8f4b3f5'
            '34b9a38f2b5e789a0d0aefa91df0fc4f18b1876589a78004e31b834e32821d98'
            '1032a78573385a7ebdbebeb88441fd041b0b377c8c2456ddf9290f11aa7ea41a'
            '0c13192f989832a2f72bcecd5e4a81b5ae744516a6e27d5f691dbd5f00167cb2'
            '7fea41a7696597bdca5014ff38940b16fdc51126df80e59647853624c807b0f9'
            '1603dfef3d3457d2414eab1fb29bbdba8bf350b59745fff2f4f6c2a34d81b5af'
            'e9464a9c0a5e7bddf6759410602088d51c41faea2c39ec5759add8ddf1305687'
            '498c39ad3cc46eab8232d5fa37627c27a27f843cbe9521f05f29b19def436e12')

noextract=('wxgui.zip')

#
#
#

#if [[ "$CARCH" == 'i686' ]]; then
#  source+=(http://repos.codelite.org/wxCrafterLibs/ArchLinux/32/wxCrafter.so)
#  md5sums+=('cd3e71e8187ce586031df070caed6c85')
#elif [[ "$CARCH" == 'x86_64' ]]; then
#  source+=(http://repos.codelite.org/wxCrafterLibs/ArchLinux/64/wxCrafter.so)
#  md5sums+=('6fcd2f0fada5fc401d0bcd62cd5452bb')
#fi


BUILD_DIR="_build"

#
#
#
prepare()
{
  # submodules
  cd "${srcdir}/${_pkg_name_ident}/submodules"

  # submodule asio
  test -d LuaBridge && rmdir LuaBridge;
  ln -s -fn ../../${_luabridge_pkg_name_ident} LuaBridge;

  # submodule assistant
  test -d assistant && rmdir assistant;
  ln -s -fn ../../${_assistant_pkg_name_ident} assistant;

  # submodule cjson
  test -d cJSON && rmdir cJSON;
  ln -s -fn ../../${_cjson_pkg_name_ident} cJSON;

  # submodule cc-wrapper
  test -d cc-wrapper && rmdir cc-wrapper;
  ln -s -fn ../../${_ccwrap_pkg_name_ident} cc-wrapper;

  # submodule ctags
  test -d ctags && rmdir ctags;
  ln -s -fn ../../${_ctags_pkg_name_ident} ctags;

  # submodule doctest
  test -d doctest && rmdir doctest;
  ln -s -fn ../../${_doctest_pkg_name_ident} doctest;

  # submodule dtl
  test -d dtl && rmdir dtl;
  ln -s -fn ../../${_dtl_pkg_name_ident} dtl;

  # submodule hunspell - ignore

  # submodule lexilla
  test -d lexilla && rmdir lexilla;
  ln -s -fn ../../${_lexilla_pkg_name_ident} lexilla;

  # submodule libssh - ignore

  # submodule lua
  test -d lua && rmdir lua;
  ln -s -fn ../../${_lua_pkg_name_ident} lua;

  # submodule openssl - ignore

  # submodule wx-config-msys2
  test -d wx-config-msys2 && rmdir wx-config-msys2;
  ln -s -fn ../../${_wxcfg_pkg_name_ident} wx-config-msys2;

  # submodule wxdap
  test -d wxdap && rmdir wxdap;
  ln -s -fn ../../${_wxdap_pkg_name_ident} wxdap;

  # submodule yaml-cpp
  test -d yaml-cpp && rmdir yaml-cpp;
  ln -s -fn ../../${_yaml_pkg_name_ident} yaml-cpp;

  # submodule zlip - ignore

  #
  # sub-submodules
  #

  # submodule tinyjson
  test -h tinyjson && rm -f tinyjson;
  test -d tinyjson && rmdir tinyjson;
  ln -s -fn ../../${_json_pkg_name_ident} tinyjson;
  # sub-submodule tinyjson (below cc-wrapper)
  test -d cc-wrapper/tinyjson && rmdir cc-wrapper/tinyjson;
  #ln -s ../tinyjson cc-wrapper/tinyjson;
  ln -s -fn ../${_ccwrap_tinyjson_pkg_name_ident} cc-wrapper/tinyjson;


  #
  # apply patches
  #
  cd "${srcdir}/${_pkg_name_ident}/"

  #patch -p0 < "${startdir}/codelite-fsw-symlink.patch"

  # dtl-v1.20 cannot compile on gcc >= 14.1.1 and clang >= 17.0.6
  #( cd submodules/dtl && patch -p0 < "${startdir}/dtl-dtl_Diff_hpp.patch" )

  # temporary disable wxcrafter build: cl-16.1.0/wxcrafter subdir build fails with wx-3.1.7 - is this still a problem - re-test !!!
  #mv wxcrafter wxcrafter.disable
}


#
#
#
build()
{
cd "${srcdir}/${_pkg_name_ident}"

CXXFLAGS="${CXXFLAGS} -fno-devirtualize"
export CXXFLAGS

# cmake find_package() will try env var WX_CONFIG as wx-config tool path before checking its builtin hardcoded naming conbinations for wx-config tool
#WX_CONFIG="wx-config"
#WX_CONFIG="wx-config-gtk2"
#WX_CONFIG="wx-config-gtk3"
#WX_CONFIG="/opt/wxgtk-dev/bin/wx-config"
WX_CONFIG="wx-config"
export WX_CONFIG

mkdir -p "${BUILD_DIR}"

# -DWITH_NATIVEBOOK=1
cmake -S . -B "${BUILD_DIR}" \
    -G "Ninja" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCL_PREFIX=/usr \
    -DWITH_PCH=0  \
    -DWITH_WX_CONFIG="${WX_CONFIG}" \
    -DENABLE_LLDB=1 \
    -DENABLE_SFTP=1 \
    -DWITH_MYSQL=0 \
    -DCOPY_WX_LIBS=0 \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \


#-DCMAKE_INSTALL_RPATH=/opt/wxgtk-dev/lib

cmake --build "${BUILD_DIR}"

}

#
#
#
package()
{
cd "${srcdir}/${_pkg_name_ident}"

DESTDIR="${pkgdir}" cmake --install "${BUILD_DIR}"

install -m 644 -D "${srcdir}/${_pkg_name_ver}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkg_name}/LICENSE"
#install -m 755 -D "${srcdir}/wxCrafter.so" "${pkgdir}/usr/lib/codelite/wxCrafter.so"
#install -m 644 -D "${srcdir}/wxgui.zip" "${pkgdir}/usr/share/codelite/wxgui.zip"

# universal-ctags experiment
#mv "${pkgdir}/usr/bin/codelite-ctags" "${pkgdir}/usr/bin/codelite-ctags.dist"
#ln -s /usr/bin/ctags "${pkgdir}/usr/bin/codelite-ctags"

}

#
# EOF
#
