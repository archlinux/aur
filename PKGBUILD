# Maintainer: LeafEvans <https://github.com/leafevans>

pkgname=sshuttlee-bin
pkgver=26.1.0
pkgrel=1
pkgdesc="Lightweight, fast and beautiful SSH + SFTP client"
arch=('x86_64')
url="https://github.com/sshuttlee/sshuttlee"
license=('Apache-2.0')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'openssl' 'libssh2')
provides=('sshuttlee')
conflicts=('sshuttlee')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sshuttlee/sshuttlee/releases/download/${pkgver}/sshuttlee-linux-x86_64.tar.gz")
sha256sums=('7ee099e943722b98f6e67094aac32f9b493df877b85b9c1a32ba222aea45fa68')

package() {
  install -Dm755 sshuttlee "${pkgdir}/usr/bin/sshuttlee"
  install -Dm644 sshuttlee.desktop "${pkgdir}/usr/share/applications/sshuttlee.desktop"
  install -Dm644 icon.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/sshuttlee.png"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
