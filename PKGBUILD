# Maintainer: Hans-Peter Deifel <hpd@hpdeifel.de>
pkgname=hledger-iadd-bin
_pkgname=hledger-iadd
pkgver=1.3.9
pkgrel=1
pkgdesc="Terminal UI as drop-in replacement for hledger add"
arch=('x86_64')
url="https://github.com/hpdeifel/hledger-iadd"
license=('GPL')
depends=(gmp)
provides=(hledger-iadd)
source=(https://github.com/hpdeifel/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-archlinux.tar.xz)
sha1sums=('e8da4bc7b9d8774fdcff92be9db6380a62992e25')
sha256sums=('19620ddb7acd284c1b2f61d003e1b0753de4f4909921bf8a26aad877c3e34600')

package() {
  cd "$srcdir/"

  install -d "${pkgdir}/usr/bin"
  install -m755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

# vim:set ts=2 sw=2 et:
