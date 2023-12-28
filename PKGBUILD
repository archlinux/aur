# Maintainer: erdii <me@erdii.engineering

pkgname=rymdport-bin
pkgver=3.5.1
pkgrel=2
pkgdesc="Cross-platform application for easy encrypted sharing of files, folders, and text between devices."
url="https://github.com/Jacalz/rymdport"
license=('GPLv3')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Jacalz/rymdport/releases/download/v${pkgver}/rymdport-v${pkgver}-linux-amd64.tar.xz")
sha256sums=('4692c8f59f9fa86f34d3fd3fa8b8fb0b5ffe9be8b0c3abb48e0486aa1137fd89')

package() {
  install -Dm755 "${srcdir}/usr/local/bin/rymdport" "${pkgdir}/usr/bin/rymdport"
  install -Dm644 "${srcdir}/usr/local/share/pixmaps/Rymdport.png" "${pkgdir}/usr/share/pixmaps/Rymdport.png"
  install -Dm644 "${srcdir}/usr/local/share/applications/Rymdport.desktop" "${pkgdir}/usr/share/applications/Rymdport.desktop"
}
