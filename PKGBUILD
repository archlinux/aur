# Maintainer: Ben Wolsieffer <benwolsieffer@gmail.com>

pkgname=keepass-plugin-quickunlock
pkgver=2.2
pkgrel=1
pkgdesc="KeePass 2.x plugin which lets you unlock databases quickly"
license=('MIT')
depends=('keepass')
arch=('any')
url="https://github.com/KN4CK3R/KeePassQuickUnlock"
source=(https://github.com/KN4CK3R/KeePassQuickUnlock/releases/download/v${pkgver}/KeePassQuickUnlock.plgx
        https://raw.githubusercontent.com/KN4CK3R/KeePassQuickUnlock/v${pkgver}/LICENSE)
sha256sums=('5ca38cd213b7b06679e414315172ad33286f14c45d9715875d8bfc58a322cb16'
            '852bcc033a46c62f99fb5ffd43b3241ba2c0c440c6034aa2114505f2c4f03c4a')

package() {
    mkdir -p "${pkgdir}/usr/share/keepass/plugins"
    install -m644 KeePassQuickUnlock.plgx "${pkgdir}/usr/share/keepass/plugins/"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
