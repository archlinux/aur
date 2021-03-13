# Maintainer: Hans-Peter Deifel <hpd@hpdeifel.de>
pkgname=hledger-iadd-bin
_pkgname=hledger-iadd
pkgver=1.3.14
pkgrel=1
pkgdesc="Terminal UI as drop-in replacement for hledger add"
arch=('x86_64')
url="https://github.com/hpdeifel/hledger-iadd"
license=('GPL')
depends=(gmp)
provides=(hledger-iadd)
source=(https://github.com/hpdeifel/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-archlinux.tar.xz)
sha1sums=('b6c619c9460862427a02547fa9fc5f9c4d5598ac')
sha256sums=('9f06f5f543f2a43af70bc0551ed2a6864c765c1406b8776e4733e81c24e1405b')

package() {
  cd "$srcdir/"

  install -d "${pkgdir}/usr/bin"
  install -m755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

# vim:set ts=2 sw=2 et:
