# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
_module="iop"
_platform="ps2"
_target="mipsel-${_platform}"
_base="toolchain"
pkgname="${_platform}-${_module}"
pkgver=v1.0
pkgrel=1
_pkgdesc=("IOP compiler used in the creation of homebrew software "
          "for the Sony PlayStation® 2 videogame system.")
pkgdesc="${_pkgdesc[*]}"
arch=('x86_64')
license=('BSD')
_github="https://github.com/ps2dev"
_local="ssh://git@127.0.0.1:/home/git"
url="${_github}/${_platform}${_base}-${_module}"
checkdepends=('shellcheck')
depends=("${_target}-"{"irx","elf"}"-binutils"
         "${_target}-"{"irx","elf"}"-gcc-stage1")
optdepends=()

build() {
  echo "metapackage"
}

# shellcheck disable=SC2154
package() {
  echo "metapackage"
}
