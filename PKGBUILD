# Maintainer: erdii <me@erdii.engineering

pkgname=rymdport-bin
pkgver=3.3.6
pkgrel=2
pkgdesc="Cross-platform application for easy encrypted sharing of files, folders, and text between devices."
url="https://github.com/Jacalz/rymdport"
license=('GPLv3')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Jacalz/rymdport/releases/download/v${pkgver}/rymdport-v${pkgver}-linux-amd64.tar.xz")
sha256sums=('fb96727cc320bc0af82c58426cd0eb9677d5bfc67c947a57a57350ff9a2f1478')

package() {
  install -Dm755 "${srcdir}/usr/local/bin/rymdport" "${pkgdir}/usr/bin/rymdport"
  install -Dm644 "${srcdir}/usr/local/share/pixmaps/rymdport.png" "${pkgdir}/usr/share/pixmaps/rymdport.png"
  install -Dm644 "${srcdir}/usr/local/share/applications/rymdport.desktop" "${pkgdir}/usr/share/applications/rymdport.desktop"
}
