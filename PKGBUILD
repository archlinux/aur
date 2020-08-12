# Maintainer: Manish Jain <bourne.identity@hotmail.com>

pkgname=poshinit
pkgver=2.0
pkgrel=1
pkgdesc="Portable Shell Initialization"
arch=(any)
license=(GPL2)
url="https://github.com/bourne-again/poshinit"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bourne-again/${pkgname}/archive/${pkgver}.tar.gz")

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 ${pkgname} "${pkgdir}"/usr/bin/${pkgname}
  install -Dm644 ${pkgname}.1 "${pkgdir}"/usr/share/man/man1/${pkgname}.1
}
sha256sums=('237c5fca5019c6a67ce3229386698a5020d55e03d2533c176aa3dd6a02c112fc')
