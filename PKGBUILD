# Maintainer: erdii <me@erdii.engineering

pkgname=rymdport-bin
pkgver=3.7.0
pkgrel=1
pkgdesc="Cross-platform application for easy encrypted sharing of files, folders, and text between devices."
url="https://github.com/Jacalz/rymdport"
license=('GPLv3')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Jacalz/rymdport/releases/download/v${pkgver}/rymdport-v${pkgver}-linux-amd64.tar.xz")
sha256sums=('596880bee4fabe24631c46c674cc3ab892010e5104fbd1e238680ebedf0afd27')

package() {
  install -Dm755 "${srcdir}/rymdport-v${pkgver}-linux-amd64/usr/local/bin/rymdport" "${pkgdir}/usr/bin/rymdport"
  install -Dm644 "${srcdir}/rymdport-v${pkgver}-linux-amd64/usr/local/share/pixmaps/Rymdport.png" "${pkgdir}/usr/share/pixmaps/Rymdport.png"
  install -Dm644 "${srcdir}/rymdport-v${pkgver}-linux-amd64/usr/local/share/applications/Rymdport.desktop" "${pkgdir}/usr/share/applications/Rymdport.desktop"
}
