# Maintainer: Raphael Bitton <raphael@rbitton.com>
pkgname=worldforge-bin
_pkgname=worldforge
pkgver=0.1.0
pkgrel=1
pkgdesc="A world simulation engine. Simple rules, emergent civilizations, and a narrative that writes itself."
arch=('x86_64')
url="https://git.skylantix.com/hermes/worldforge"
license=('GPL-3.0-or-later')
provides=('worldforge')
conflicts=('worldforge')
source=("worldforge-${pkgver}-linux-amd64::https://git.skylantix.com/api/v4/projects/hermes%2Fworldforge/packages/generic/worldforge/${pkgver}/worldforge-linux-amd64"
        "LICENSE-${pkgver}::https://git.skylantix.com/hermes/worldforge/-/raw/v${pkgver}/LICENSE")
sha256sums=('5c8c4dbf752ae298f266decef1b811688d3365fdd0138a37511c2b2b7e4a0a4a' 'bee7ee25f14a0f45a0d36dff8007e82829235938e52a18f2ebafba279a08e5c6')

package() {
    install -Dm755 "worldforge-${pkgver}-linux-amd64" "$pkgdir/usr/bin/worldforge"
    install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
