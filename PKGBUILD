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
_pkg_ver="18.1.0"
#_commit="15aff6f1b7bac11572190407a533d83a59d12aee"

# pkg
pkgname="${_pkg_name}-unstable"
#pkgver=${_pkg_ver}
#pkgver="${_pkg_ver//_/-}"
pkgver="${_pkg_ver/-*/}"
pkgrel=2

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

# b73dc1d2c0ecb9452a87c26544d7f71e24342df6 submodules/asio (asio-1-12-0-54-gb73dc1d2c)
# fd1ac4f1791b403af1f7350b1195ac114f9b792b submodules/cJSON (v0.0.0~50^2^2~16)
# 67713440e867493e74ce5c7ce0352b81eb4b726b submodules/cc-wrapper (remotes/origin/HEAD)
# 930be27ea34f28bea45a2af76b974734de8fbcc5 submodules/ctags (p6.1.20240728.0)
# f2651ff29d42abd036980e42d6ee26e598720508 submodules/dtl (v1.20-1-gf2651ff)
# 1d9a9ca8841ac0cd591c95b162301d2502641901 submodules/hunspell (v1.7.2-92-g1d9a9ca)
# 8502988a5eb83fcd281ee5a38533a9f170e6b2bf submodules/lexilla (remotes/origin/HEAD)
# f3fe85f45ef1158c3f97a6abe804df2bcb0df352 submodules/libssh (libssh-0.8.0-2187-gf3fe85f4)
# c3776cacabce2ee35f172fb72be7a519752125fa submodules/llama.cpp (gguf-v0.4.0-2118-gc3776cac)
# da217f13d734fe51ccc2d9b986d5f16ccba14bdd submodules/openssl-cmake (1.1.1k-20210430-12-gda217f1)
# c6d7e295bf5a0ab9b5f896720cc1a0e0fdc397a7 submodules/websocketpp (0.3.0-395-gc6d7e29)
# fe65daf2a49e2a1f218ea3106a26d5ae7c4235fb submodules/wx-config-msys2 (heads/main)
# c5ee34742728f97fa30d0877b925b260466057ba submodules/wxdap (heads/master-21-gc5ee347)
# b5dc09a9b94b9955ef98111d0f311cb43f32f649 submodules/wxsf-code (heads/main-2-gb5dc09a)
# 1b50109f7bea60bd382d8ea7befce3d2bd67da5f submodules/yaml-cpp (yaml-cpp-0.7.0-41-g1b50109)
# 0f51fb4933fc9ce18199cb2554dacea8033e7fd3 submodules/zlib (v1.3.1-50-g0f51fb4)

# NOTE these submodules are currenly only used by macos builds - ignore them for now:
# NOTE: submodules/hunspell, submodules/libssh, submodules/openssl-cmake, submodules/zlib

# asio submodule: https://github.com/chriskohlhoff/asio.git
_asio_pkg_user="chriskohlhoff"
_asio_pkg_name="asio"
_asio_pkg_ident="b73dc1d2c0ecb9452a87c26544d7f71e24342df6"
_asio_pkg_name_ident="${_asio_pkg_user}-${_asio_pkg_name}-${_asio_pkg_ident:0:7}"
_asio_pkg_src_res="${_asio_pkg_name_ident}.tar.gz::https://github.com/${_asio_pkg_user}/${_asio_pkg_name}/tarball/${_asio_pkg_ident}"

# ccwrap submodule: https://github.com/eranif/cc-wrapper
_ccwrap_pkg_user="${_pkg_user}"
_ccwrap_pkg_name="cc-wrapper"
_ccwrap_pkg_ident="67713440e867493e74ce5c7ce0352b81eb4b726b"
_ccwrap_pkg_name_ident="${_ccwrap_pkg_user}-${_ccwrap_pkg_name}-${_ccwrap_pkg_ident:0:7}"
_ccwrap_pkg_src_res="${_ccwrap_pkg_name_ident}.tar.gz::https://github.com/${_ccwrap_pkg_user}/${_ccwrap_pkg_name}/tarball/${_ccwrap_pkg_ident}"

# cjson submodule: https://github.com/DaveGamble/cJSON
_cjson_pkg_user="DaveGamble"
_cjson_pkg_name="cJSON"
_cjson_pkg_ident="fd1ac4f1791b403af1f7350b1195ac114f9b792b"
_cjson_pkg_name_ident="${_cjson_pkg_user}-${_cjson_pkg_name}-${_cjson_pkg_ident:0:7}"
_cjson_pkg_src_res="${_cjson_pkg_name_ident}.tar.gz::https://github.com/${_cjson_pkg_user}/${_cjson_pkg_name}/tarball/${_cjson_pkg_ident}"

# ctags submodule: https://github.com/eranif/ctags
_ctags_pkg_user="${_pkg_user}"
_ctags_pkg_name="ctags"
_ctags_pkg_ident="930be27ea34f28bea45a2af76b974734de8fbcc5"
_ctags_pkg_name_ident="${_ctags_pkg_user}-${_ctags_pkg_name}-${_ctags_pkg_ident:0:7}"
_ctags_pkg_src_res="${_ctags_pkg_name_ident}.tar.gz::https://github.com/${_ctags_pkg_user}/${_ctags_pkg_name}/tarball/${_ctags_pkg_ident}"

# dtl submodule: https://github.com/cubicdaiya/dtl
_dtl_pkg_user="cubicdaiya"
_dtl_pkg_name="dtl"
_dtl_pkg_ident="f2651ff29d42abd036980e42d6ee26e598720508"
_dtl_pkg_name_ident="${_dtl_pkg_user}-${_dtl_pkg_name}-${_dtl_pkg_ident:0:7}"
_dtl_pkg_src_res="${_dtl_pkg_name_ident}.tar.gz::https://github.com/${_dtl_pkg_user}/${_dtl_pkg_name}/tarball/${_dtl_pkg_ident}"

# lexilla submodule: https://github.com/eranif/lexilla.git
_lexilla_pkg_user="eranif"
_lexilla_pkg_name="lexilla"
_lexilla_pkg_ident="8502988a5eb83fcd281ee5a38533a9f170e6b2bf"
_lexilla_pkg_name_ident="${_lexilla_pkg_user}-${_lexilla_pkg_name}-${_lexilla_pkg_ident:0:7}"
_lexilla_pkg_src_res="${_lexilla_pkg_name_ident}.tar.gz::https://github.com/${_lexilla_pkg_user}/${_lexilla_pkg_name}/tarball/${_lexilla_pkg_ident}"

# llama.cpp submodule: https://github.com/ggerganov/llama.cpp.git
_llama_pkg_user="ggerganov"
_llama_pkg_name="llama.cpp"
_llama_pkg_ident="c3776cacabce2ee35f172fb72be7a519752125fa"
_llama_pkg_name_ident="${_llama_pkg_user}-${_llama_pkg_name}-${_llama_pkg_ident:0:7}"
_llama_pkg_src_res="${_llama_pkg_name_ident}.tar.gz::https://github.com/${_llama_pkg_user}/${_llama_pkg_name}/tarball/${_llama_pkg_ident}"

# websocket submodule: https://github.com/zaphoyd/websocketpp.git
_wspp_pkg_user="zaphoyd"
_wspp_pkg_name="websocketpp"
_wspp_pkg_ident="c6d7e295bf5a0ab9b5f896720cc1a0e0fdc397a7"
_wspp_pkg_name_ident="${_wspp_pkg_user}-${_wspp_pkg_name}-${_wspp_pkg_ident:0:7}"
_wspp_pkg_src_res="${_wspp_pkg_name_ident}.tar.gz::https://github.com/${_wspp_pkg_user}/${_wspp_pkg_name}/tarball/${_wspp_pkg_ident}"

# wxcfg/wx-config-msys2s submodule: https://github.com/eranif/wx-config-msys2.git
_wxcfg_pkg_user="${_pkg_user}"
_wxcfg_pkg_name="wx-config-msys2"
_wxcfg_pkg_ident="fe65daf2a49e2a1f218ea3106a26d5ae7c4235fb"
_wxcfg_pkg_name_ident="${_wxcfg_pkg_user}-${_wxcfg_pkg_name}-${_wxcfg_pkg_ident:0:7}"
_wxcfg_pkg_pkg_res="${_wxcfg_pkg_name_ident}.tar.gz::https://github.com/${_wxcfg_pkg_user}/${_wxcfg_pkg_name}/tarball/${_wxcfg_pkg_ident}"

# wxdap/wxdap submodule: https://github.com/eranif/wxdap
_wxdap_pkg_user="${_pkg_user}"
_wxdap_pkg_name="wxdap"
_wxdap_pkg_ident="c5ee34742728f97fa30d0877b925b260466057ba"
_wxdap_pkg_name_ident="${_wxdap_pkg_user}-${_wxdap_pkg_name}-${_wxdap_pkg_ident:0:7}"
_wxdap_pkg_src_res="${_wxdap_pkg_name_ident}.tar.gz::https://github.com/${_wxdap_pkg_user}/${_wxdap_pkg_name}/tarball/${_wxdap_pkg_ident}"

# wxshapeframework submodule: https://github.com/wxShaper/wxsf-code.git
_wxsf_pkg_user="wxShaper"
_wxsf_pkg_name="wxsf-code"
_wxsf_pkg_ident="b5dc09a9b94b9955ef98111d0f311cb43f32f649"
_wxsf_pkg_name_ident="${_wxsf_pkg_user}-${_wxsf_pkg_name}-${_wxsf_pkg_ident:0:7}"
_wxsf_pkg_src_res="${_wxsf_pkg_name_ident}.tar.gz::https://github.com/${_wxsf_pkg_user}/${_wxsf_pkg_name}/tarball/${_wxsf_pkg_ident}"

# yaml-cpp submodule: https://github.com/jbeder/yaml-cpp
_yaml_pkg_user="jbeder"
_yaml_pkg_name="yaml-cpp"
_yaml_pkg_ident="1b50109f7bea60bd382d8ea7befce3d2bd67da5f"
_yaml_pkg_name_ident="${_yaml_pkg_user}-${_yaml_pkg_name}-${_yaml_pkg_ident:0:7}"
_yaml_pkg_src_res="${_yaml_pkg_name_ident}.tar.gz::https://github.com/${_yaml_pkg_user}/${_yaml_pkg_name}/tarball/${_yaml_pkg_ident}"

# tinyjson (cc-wrapper) sub-submodule: https://github.com/eranif/tinyjson
_json_pkg_user="${_pkg_user}"
_json_pkg_name="tinyjson"
_json_pkg_ident="a6b0d0d31a05a9f55b4944b3b20f769305eb583a"
_json_pkg_name_ident="${_json_pkg_user}-${_json_pkg_name}-${_json_pkg_ident:0:7}"
_json_pkg_src_res="${_json_pkg_name_ident}.tar.gz::https://github.com/${_json_pkg_user}/${_json_pkg_name}/tarball/${_json_pkg_ident}"


#
pkgdesc="Cross platform IDE for C, C++, Rust, Python, PHP and Node.js written in C++"
arch=('i686' 'x86_64' 'aarch64')
url="https://codelite.org/"
license=("GPL-2.0-or-later")

makedepends=('pkgconfig' 'cmake' 'ninja' 'clang')

depends=(
    'wxwidgets-gtk3'
    'libedit'
    'libssh'
    'mariadb-libs'
    'ncurses'
    'uchardet'
    'hunspell'
    #'ctags'
    #'xterm'
    #'wget'
    #'curl'
    #'python'
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
    "${_asio_pkg_src_res}"
    "${_ccwrap_pkg_src_res}"
    "${_cjson_pkg_src_res}"
    "${_ctags_pkg_src_res}"
    "${_dtl_pkg_src_res}"
    "${_lexilla_pkg_src_res}"
    "${_llama_pkg_src_res}"
    "${_wspp_pkg_src_res}"
    "${_wxcfg_pkg_pkg_res}"
    "${_wxdap_pkg_src_res}"
    "${_wxsf_pkg_src_res}"
    "${_yaml_pkg_src_res}"
    "${_json_pkg_src_res}"
    "http://repos.codelite.org/wxCrafterLibs/wxgui.zip"
  )

sha256sums=('81b839e3544e9bb0119f0a76688ebc69ac828fd254232b0b423aa027bbbc9fb8'
            '31103eceeeee2a8119b0a4c9a5e5752ea94329941b9e9beaf67595c985aa3794'
            '9343c1f05956308c7f3c4b6ad33d68c08d95ef0ffcdce0ec6c883ccd21bd5f71'
            '70518c1b8203359c19b0313e05639568d8089cf9ffa9c9784970fdd69ab6eaad'
            '43b3fae85b398ccca8b4a1ce3308fdec64e9ee2f5ee8a2c4524f6c18f80ca911'
            'bfdcec8f15e3d7aa4206c14baa8132f5f77c9198f5993114666404f97bd5075c'
            '34b9a38f2b5e789a0d0aefa91df0fc4f18b1876589a78004e31b834e32821d98'
            'ac51138f2e12056936c64f98d4fc8e12cdf1a4579e1e5f9dbcee7a71288a423a'
            'd5e2d3c9091dc3db660aaa1fb0c0c10dec95dabbeb42066d9bddc78491606e10'
            '70aca36b95e2245740c17fc9a164fd6edabfd9c631184ea66cc5ee03ff54c028'
            'f73110098732aecbfa160994261203be9bdacf16651df7a988911a9ef8199449'
            'bbc2c89cef2daba4aa15340ae73189c16dac5d20b8e2f98e9b120d4b6507d2a7'
            '57f06c89f41cc2cd250b8b1db582fe27a0da67eb7a480cd8eb3d35cde64b58cd'
            'ff539f3e2ee4c52073e8b73fd8046163d68b0db567ce7ea5b9438424dc3a2253'
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

  # submodule cc-wrapper
  test -d asio && rmdir asio
  ln -s -fn ../../${_asio_pkg_name_ident} asio

  # submodule cc-wrapper
  test -d cc-wrapper && rmdir cc-wrapper
  ln -s -fn ../../${_ccwrap_pkg_name_ident} cc-wrapper

  # submodule cjson
  test -d cJSON && rmdir cJSON
  ln -s -fn ../../${_cjson_pkg_name_ident} cJSON

  # submodule ctags
  test -d ctags && rmdir ctags
  ln -s -fn ../../${_ctags_pkg_name_ident} ctags

  # submodule dtl
  test -d dtl && rmdir dtl
  ln -s -fn ../../${_dtl_pkg_name_ident} dtl

  # submodule lexilla
  test -d lexilla && rmdir lexilla
  ln -s -fn ../../${_lexilla_pkg_name_ident} lexilla

  # submodule llama.cpp
  test -d llama.cpp && rmdir llama.cpp
  ln -s -fn ../../${_llama_pkg_name_ident} llama.cpp

  # submodule tinyjson
  test -h tinyjson && rm -f tinyjson
  test -d tinyjson && rmdir tinyjson
  ln -s -fn ../../${_json_pkg_name_ident} tinyjson
  # sub-submodule tinyjson (below cc-wrapper)
  test -d cc-wrapper/tinyjson && rmdir cc-wrapper/tinyjson
  #ln -s ../tinyjson cc-wrapper/tinyjson
  ln -s -fn ../${_json_pkg_name_ident} cc-wrapper/tinyjson

  # submodule websocketpp
  test -d websocketpp && rmdir websocketpp
  ln -s -fn ../../${_wspp_pkg_name_ident} websocketpp

  # submodule wxdap
  test -d wxdap && rmdir wxdap
  ln -s -fn ../../${_wxdap_pkg_name_ident} wxdap

  # submodule wx-config-msys2
  test -d wx-config-msys2 && rmdir wx-config-msys2
  ln -s -fn ../../${_wxcfg_pkg_name_ident} wx-config-msys2

  # submodule wxsf
  test -d wxsf-code && rmdir wxsf-code
  ln -s -fn ../../${_wxsf_pkg_name_ident} wxsf-code

  # submodule yaml-cpp
  test -d yaml-cpp && rmdir yaml-cpp
  ln -s -fn ../../${_yaml_pkg_name_ident} yaml-cpp




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
#cd "${BUILD_DIR}"

# -DWITH_NATIVEBOOK=1
cmake -B "${BUILD_DIR}" -S . -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -DWITH_PCH=0 -DWITH_WX_CONFIG=${WX_CONFIG} -DENABLE_LLDB=1 -DWITH_MYSQL=0 -DCMAKE_INSTALL_LIBDIR=lib -DCOPY_WX_LIBS=0
#-DCMAKE_INSTALL_RPATH=/opt/wxgtk-dev/lib

#make -C "${BUILD_DIR}"
cmake --build "${BUILD_DIR}"

}

#
#
#
package()
{
cd "${srcdir}/${_pkg_name_ident}"

#make -C "${BUILD_DIR}" -j1 DESTDIR="${pkgdir}" install
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
