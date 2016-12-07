# Maintainer: Ben Wolsieffer <benwolsieffer@gmail.com>

pkgname=keepass-plugin-quickunlock
pkgver=2.1.1
pkgrel=1
pkgdesc="KeePass 2.x plugin which lets you unlock databases quickly"
license=('MIT')
depends=('keepass')
arch=('any')
url="https://github.com/KN4CK3R/KeePassQuickUnlock"
source=(https://github.com/KN4CK3R/KeePassQuickUnlock/releases/download/v${pkgver}/KeePassQuickUnlock.plgx
        https://github.com/KN4CK3R/KeePassQuickUnlock/blob/v${pkgver}/LICENSE)
sha256sums=('d55b30c25e54f5ef8f6b15b09c8fd5f37e718ad5c3f8bc3115ada19ea9b4bc68'
            '261c7dbc7b6ec7a61d5f30fad1e8d7e868a3f642c6e73a1f27d782c7ee964edd')

package() {
    mkdir -p "${pkgdir}"/usr/share/keepass/plugins
    install -m644 KeePassQuickUnlock.plgx "${pkgdir}"/usr/share/keepass/plugins/
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
