# Maintainer: Kevin K. <kbknapp@gmail.com>

_pkgname=clog
pkgname=${_pkgname}-bin
pkgrel=1
pkgver=v0.8.2
pkgdesc="A conventional changelog for the rest of us"
url="https://github.com/thoughtram/clog"
provides=('clog')
arch=('x86_64')
license=('MIT')
makedepends=()
conflicts=('clog-git')
replaces=('clog-git')
backup=()
install=''
source=("http://wod.twentyfives.net/bin/${_pkgname}/${_pkgname}-${pkgver//_/-}-${CARCH}-unknown-linux-gnu.tar.gz")
sha256sums=('4d2bda2c691b4227424e871454469075d1636070d37e1037287cf08f027c2e66')

package() {
  cd "${srcdir}/${_pkgname}/"

  install -D -m644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"
  install -Dm 0755 bin/clog "${pkgdir}/usr/bin/${_pkgname}"
}

