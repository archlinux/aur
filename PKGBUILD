# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
# _target="arm-none-eabi"
target="mips64r5900el-ps2-elf"
_module="ee"
_platform="ps2"
_pe="pthread-embedded"
_base="toolchain"
pkgname="${_platform}-${_module}"
pkgver=v1.0
_gcc_ver="v11.3.0"
_newlib_ver="v4.1.0"
pkgrel=1
_pkgdesc=("EE compiler which is used in the creation of homebrew software "
          "for the Sony PlayStation® 2 videogame system.")
pkgdesc="${_pkgdesc[*]}"
arch=('x86_64')
license=('BSD')
_github="https://github.com/ps2dev"
_local="ssh://git@127.0.0.1:/home/git"
url="${_github}/${_platform}${_base}-${_module}"
checkdepends=('shellcheck')
depends=("${target}-gcc")
optdepends=()

build() {
  echo "I'm a metapackage"
}

package() {
  echo "I'm a metapackage"
}
