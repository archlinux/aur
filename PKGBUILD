# Maintainer: Ryan Farley <ryan.farley@gmx.com>

pkgname=keepass-plugin-qrcodeview
pkgver=1.0.2
pkgrel=1
pkgdesc="KeePass 2.x plugin which shows QR Codes for entry fields."
arch=(any)
url="https://github.com/KN4CK3R/KeePassQRCodeView"
license=('MIT')
depends=(keepass)
source=("https://github.com/KN4CK3R/KeePassQRCodeView/releases/download/v${pkgver}/KeePassQRCodeView.plgx")

package() {
    cd "$srcdir"
    install -m 644 -D KeePassQRCodeView.plgx "${pkgdir}/usr/share/keepass/plugins/KeePassQRCodeView.plgx"
}

md5sums=('82b1c458362e88a0f20d27f69ea40e82')
