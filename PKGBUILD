# Maintainer: erdii <me@erdii.engineering

pkgname=rymdport-bin
pkgver=3.5.3
pkgrel=1
pkgdesc="Cross-platform application for easy encrypted sharing of files, folders, and text between devices."
url="https://github.com/Jacalz/rymdport"
license=('GPLv3')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Jacalz/rymdport/releases/download/v${pkgver}/rymdport-v${pkgver}-linux-amd64.tar.xz")
sha256sums=('5fc2342aced5bb7cec66b4d3b3c75fe70dd27eafcaae405db4e0652d502511c8')

package() {
  install -Dm755 "${srcdir}/usr/local/bin/rymdport" "${pkgdir}/usr/bin/rymdport"
  install -Dm644 "${srcdir}/usr/local/share/pixmaps/Rymdport.png" "${pkgdir}/usr/share/pixmaps/Rymdport.png"
  install -Dm644 "${srcdir}/usr/local/share/applications/Rymdport.desktop" "${pkgdir}/usr/share/applications/Rymdport.desktop"
}
