# Maintainer: Ryan Farley <ryan.farley@gmx.com>

pkgname=keepass-plugin-qrcodeview
pkgver=1.0.3.2
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

md5sums=('b6f3f0e234e00bc996ff541e25c649e1')
