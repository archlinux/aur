# Maintainer: Ben Wolsieffer <benwolsieffer@gmail.com>

pkgname=keepass-plugin-quickunlock
pkgver=2.4
pkgrel=1
pkgdesc="KeePass 2.x plugin which lets you unlock databases quickly"
license=('MIT')
depends=('keepass')
arch=('any')
url="https://github.com/JanisEst/KeePassQuickUnlock"
source=(https://github.com/JanisEst/KeePassQuickUnlock/releases/download/v${pkgver}/KeePassQuickUnlock.plgx
        https://raw.githubusercontent.com/JanisEst/KeePassQuickUnlock/v${pkgver}/LICENSE)
sha256sums=('feaf3323f30def99448f170e5c39db1f58fc9008fe8d3686fa99c98b9039cd50'
            '852bcc033a46c62f99fb5ffd43b3241ba2c0c440c6034aa2114505f2c4f03c4a')

package() {
    mkdir -p "${pkgdir}/usr/share/keepass/plugins"
    install -m644 KeePassQuickUnlock.plgx "${pkgdir}/usr/share/keepass/plugins/"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
