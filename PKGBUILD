# Maintainer: erdii <me@erdii.engineering

pkgname=rymdport-bin
pkgver=3.0.2
pkgrel=2
pkgdesc="Cross-platform application for easy encrypted sharing of files, folders, and text between devices."
url="https://github.com/Jacalz/rymdport"
license=('GPLv3')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Jacalz/rymdport/releases/download/v${pkgver}/rymdport-v${pkgver}-linux-amd64.tar.xz")
sha256sums=('c29844d0049fa8f2ede6776e0707961f7ac5405bd7186e26c0647050cb7fdd77')

package() {
  install -Dm755 "${srcdir}/usr/local/bin/rymdport" "${pkgdir}/usr/bin/rymdport"
  install -Dm644 "${srcdir}/usr/local/share/pixmaps/rymdport.png" "${pkgdir}/usr/share/pixmaps/rymdport.png"
  install -Dm644 "${srcdir}/usr/local/share/applications/rymdport.desktop" "${pkgdir}/usr/share/applications/rymdport.desktop"
}
