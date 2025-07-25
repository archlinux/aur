# Maintainer: erdii <me@erdii.engineering

pkgname=rymdport-bin
pkgver=3.9.0
pkgrel=1
pkgdesc="Cross-platform application for easy encrypted sharing of files, folders, and text between devices."
url="https://github.com/Jacalz/rymdport"
license=('GPLv3')
depends=('libglvnd' 'libxcursor' 'libxrandr' 'libxcursor' 'libx11' 'libxinerama' 'libxi')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Jacalz/rymdport/releases/download/v${pkgver}/rymdport-v${pkgver}-linux-x86_64.tar.xz")
sha256sums=('725988067878ac7de1465b7cab2572b13b8597ac9e3138d5e5d3855b2af21823')

package() {
  install -Dm755 "${srcdir}/usr/local/bin/rymdport" "${pkgdir}/usr/bin/rymdport"
  install -Dm644 "${srcdir}/usr/local/share/pixmaps/Rymdport.png" "${pkgdir}/usr/share/pixmaps/Rymdport.png"
  install -Dm644 "${srcdir}/usr/local/share/applications/Rymdport.desktop" "${pkgdir}/usr/share/applications/Rymdport.desktop"
}
