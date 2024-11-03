# Maintainer: Edmund Lodewijks <e.lodewijks@gmail.com>

pkgname=usb_resetter
pkgver=1.3.0
pkgrel=2
pkgdesc="Tool to reset USB controllers, hubs or devices"
arch=("any")
url="https://github.com/netinvent/usb_resetter"
license=("BSD-3-Clause")
depends=("python")
makedepends=("git")
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c22c3a902e3b654263cbc355c94f67264c764570805988515aa25713c854afc5')

package () {
  install -Dm755 "${srcdir}"/${pkgname}-${pkgver}/${pkgname}/${pkgname}.py "${pkgdir}"/usr/bin/${pkgname}.py
  install -Dm644 "${srcdir}"/${pkgname}-${pkgver}/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  install -Dm644 "${srcdir}"/${pkgname}-${pkgver}/README.md "${pkgdir}"/usr/share/doc/${pkgname}/README
}
