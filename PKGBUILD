# Maintainer: Hans-Peter Deifel <hpd@hpdeifel.de>
pkgname=hledger-iadd-bin
_pkgname=hledger-iadd
pkgver=1.3.8
pkgrel=1
pkgdesc="Terminal UI as drop-in replacement for hledger add"
arch=('x86_64')
url="https://github.com/hpdeifel/hledger-iadd"
license=('GPL')
depends=(gmp)
provides=(hledger-iadd)
source=(https://github.com/hpdeifel/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-archlinux.tar.xz)
sha1sums=('7409653a0344a65d11b7ca72d09feffbce7aae65')
sha256sums=('eac925694259337d35678cd111d15ffe7725c40432548d31011c98dfe4b71d87')

package() {
  cd "$srcdir/"

  install -d "${pkgdir}/usr/bin"
  install -m755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

# vim:set ts=2 sw=2 et:
