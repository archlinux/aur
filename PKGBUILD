# Maintainer: Ryan Farley <ryan.farley@gmx.com>

pkgname=keepass-plugin-qrcodeview
pkgver=1.0.4
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

sha512sums=('4295bf954d1a3d62f99eec3a9d63f46bd94d8410ca00eea860ff178c6c34fd34c549d7a3125110433976b0c86b3f431f8e76e79b272a61b0aab1779929065a5b')
