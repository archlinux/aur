# Maintainer: erdii <me@erdii.engineering

pkgname=rymdport-bin
pkgver=3.9.1
pkgrel=0
pkgdesc="Cross-platform application for easy encrypted sharing of files, folders, and text between devices."
url="https://github.com/Jacalz/rymdport"
license=('GPLv3')
depends=('libglvnd' 'libxcursor' 'libxrandr' 'libxcursor' 'libx11' 'libxinerama' 'libxi')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Jacalz/rymdport/releases/download/v${pkgver}/rymdport-v${pkgver}-linux-x86_64.tar.xz")
sha256sums=('b7e0c98e4da90bd7a14087ec9ebe4f00b07dbe0be797d7105cf871aa22090db1')

package() {
  install -Dm755 "${srcdir}/usr/local/bin/rymdport" "${pkgdir}/usr/bin/rymdport"
  install -Dm644 "${srcdir}/usr/local/share/pixmaps/Rymdport.png" "${pkgdir}/usr/share/pixmaps/Rymdport.png"
  install -Dm644 "${srcdir}/usr/local/share/applications/Rymdport.desktop" "${pkgdir}/usr/share/applications/Rymdport.desktop"
}
