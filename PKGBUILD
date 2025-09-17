# Maintainer: Hans-Peter Deifel <hpd@hpdeifel.de>
pkgname=hledger-iadd-bin
_pkgname=hledger-iadd
pkgver=1.3.22
pkgrel=1
pkgdesc="Terminal UI as drop-in replacement for hledger add"
arch=('x86_64')
url="https://github.com/hpdeifel/hledger-iadd"
license=('GPL')
depends=(gmp)
provides=(hledger-iadd)
source=(https://github.com/hpdeifel/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-archlinux.tar.xz)
sha1sums=('372fde8d657b53c6486bf0714b8238321791c145')
sha256sums=('d12c7ad94f58ac18335744726635e78d799ee4653910ee60c64fd4a0552a0ab4')

package() {
  cd "$srcdir/"

  install -d "${pkgdir}/usr/bin"
  install -m755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

# vim:set ts=2 sw=2 et:
