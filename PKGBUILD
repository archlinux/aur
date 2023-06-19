# Maintainer: erdii <me@erdii.engineering

pkgname=rymdport-bin
pkgver=3.4.0
pkgrel=2
pkgdesc="Cross-platform application for easy encrypted sharing of files, folders, and text between devices."
url="https://github.com/Jacalz/rymdport"
license=('GPLv3')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Jacalz/rymdport/releases/download/v${pkgver}/rymdport-v${pkgver}-linux-amd64.tar.xz")
sha256sums=('42e0a4d12a40574955052ceb789d7887bcb261c08c306216dc8eec8ad717d8c3')

package() {
  install -Dm755 "${srcdir}/usr/local/bin/rymdport" "${pkgdir}/usr/bin/rymdport"
  install -Dm644 "${srcdir}/usr/local/share/pixmaps/rymdport.png" "${pkgdir}/usr/share/pixmaps/rymdport.png"
  install -Dm644 "${srcdir}/usr/local/share/applications/rymdport.desktop" "${pkgdir}/usr/share/applications/rymdport.desktop"
}
