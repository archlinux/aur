# Maintainer: Viachaslau Khalikin <khalikin'at'yandex'dot'by>

pkgname=icecat-umatrix
pkgver=1.4.0
pkgrel=1
pkgdesc='Point and click matrix to filter net requests by source, destination and type'
url=https://github.com/gorhill/uMatrix
arch=('any')
license=('GPL3')
groups=('icecat-addons')
source=("https://github.com/gorhill/uMatrix/releases/download/${pkgver}/uMatrix.firefox.xpi")
noextract=("${source##*/}")
sha256sums=('8e00959b70ba6d676a63022594d4414ce6ea3a9d13bc3099f25d282a275fb160')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/icecat/browser/extensions/uMatrix@raymondhill.net.xpi
}

# vim:set ts=2 sw=2 et:
