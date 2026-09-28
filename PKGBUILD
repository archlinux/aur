# Maintainer: Hans-Peter Deifel <hpd@hpdeifel.de>
pkgname=hledger-iadd-bin
_pkgname=hledger-iadd
pkgver=1.3.23
pkgrel=1
pkgdesc="Terminal UI as drop-in replacement for hledger add"
arch=('x86_64')
url="https://github.com/hpdeifel/hledger-iadd"
license=('GPL')
depends=(gmp)
provides=(hledger-iadd)
source=(https://github.com/hpdeifel/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-archlinux.tar.xz)
sha1sums=('6861356b492b792c62c3b7c30d42c6131defea7c')
sha256sums=('38c65db36c882b40fc4fc399d1a41b848bcd5a014d1e993d797d50f7f042da65')

package() {
  cd "$srcdir/"

  install -d "${pkgdir}/usr/bin"
  install -m755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

# vim:set ts=2 sw=2 et:
