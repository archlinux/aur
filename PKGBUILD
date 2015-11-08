# Maintainer: Kevin K. <kbknapp@gmail.com>

_pkgname=clog
pkgname=${_pkgname}-bin
pkgrel=1
pkgver=v0.9.1
pkgdesc="A conventional changelog for the rest of us"
url="https://github.com/clog-tool/clog-cli"
provides=('clog')
arch=('x86_64')
license=('MIT')
makedepends=()
conflicts=('clog-git')
replaces=('clog-git')
backup=()
install=''
source=("http://wod.twentyfives.net/bin/${_pkgname}/${_pkgname}-${pkgver//_/-}-${CARCH}-unknown-linux-gnu.tar.gz")
sha256sums=('6e83e53f81c99c923701840fa33563040f2385274790e452e1d4a63e88303fad')

package() {
  cd "${srcdir}/${_pkgname}/"

  install -D -m644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"
  install -Dm 0755 bin/clog "${pkgdir}/usr/bin/${_pkgname}"
}

