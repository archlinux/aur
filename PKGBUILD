# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
_arch="mips"
_platform="ps2"
_iop="${_arch}el-${_platform}"
_ee="${_arch}64r5900el-${_platform}-elf"
_base="sdk"
_ns="${_platform}${_base}"
_pkgbase="${_platform}${_base}-ports"
_pkg="libmad"
pkgname="${_platform}-${_pkg}"
pkgver="v1.3.0"
pkgrel=1
_pkgdesc=("Ports of useful libraries for Sony Playstation® 2 videogame system SDK.")
pkgdesc="${_pkgdesc[*]}"
arch=('x86_64')
license=('custom')
_ns="${_platform}${_base}"
_github="https://github.com/ps2dev"
_local="ssh://git@127.0.0.1:/home/git"
url="${_github}/${_pkgbase}"
depends=(
         "${_platform}-aalib"
         "${_platform}-expat"
         "${_platform}-freetype"
         "${_platform}-libconfig"
         "${_platform}-libjpeg"
         "${_platform}-libid3tag"
         "${_platform}-libmad"
         "${_platform}-libmikmod"
         "${_platform}-libpng"
         "${_platform}-libtiff"
         "${_platform}-libyaml"
         # "${_platform}-libzip"
         "${_platform}-lua"
         "${_platform}-lz4"
         "${_platform}-madplay"
         # "${_platform}-ode"
         "${_platform}-romfs"
         "${_platform}-sdl"
         "${_platform}-sdl_gfx"
         "${_platform}-sdl_image"
         "${_platform}-sdl_mixer"
         "${_platform}-sdl_ttf"
         "${_platform}-xz"
         "${_platform}-zlib"
)
makedepends=("${_platform}-sdk")
optdepends=()
_commit="e3f9bfd51e3266b3c68de19b76f6d378f6ec643b"
source=("${pkgname}::git+${url}#commit=${_commit}")
# source=("${pkgname}::git+${_local}/${pkgname}#commit=${_commit}")
sha256sums=('SKIP')

build() {
  echo "metapackage"
}

# shellcheck disable=SC2154
package() {
  echo "metapackage"
}
