# Maintainer: Donald Carr<sirspudd@gmail.com>
# Upstream URL: https://wiki.qt.io/Qt_Build_Suite
#
# For improvements/fixes to this package, please send a pull request:
# http://code.qt.io/cgit/qt-labs/qbs.git/

pkgname=qpi-toolchain
pkgver=5.3.0
pkgrel=2
pkgdesc="cross-tool-ng compiled gcc 5.3 hf toolchain for the pi"
arch=("x86_64")
license=("GPL")
makedepends=("git")

_toolchainreponame=crosstool-ng-toolchains
_toolchainname=arm-sirspuddarch-linux-gnueabihf
url="https://github.com/sirspudd/${_toolchainreponame}"
source=("git://github.com/sirspudd/${_toolchainreponame}.git")
sha256sums=("SKIP")

package() {
  local destdir="${pkgdir}/opt"
  mkdir -p "${destdir}"
  cp -r "${srcdir}/${_toolchainreponame}/${_toolchainname}" "${destdir}"
}
