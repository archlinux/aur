# Maintainer: draxaris1010
pkgname=cautious-launcher
pkgver=3.70
pkgrel=1
_ubunturel=+nmu1ubuntu1
pkgdesc="A wrapper program that only opens a file if exec bit is set.(from mailcap on ubuntu)"
url=https://packages.ubuntu.com/search?keywords=mailcap
arch=(any)
license=(GPL)
depends=(zenity)
conflicts=()
makedepends=()
source=(http://archive.ubuntu.com/ubuntu/pool/main/m/mailcap/mailcap_${pkgver}${_ubunturel}.tar.xz)
sha256sums=(caebcf23d9d47ea6b75fda5e191521e495e527e47b4fca74ac3802de4adcce71)

package() {
    install -d -m 0755 "${pkgdir}/usr/bin"
    install -m 0755 "${srcdir}/mailcap-${pkgver}${_ubunturel}/debian/cautious-launcher" "${pkgdir}/usr/bin/"
}
