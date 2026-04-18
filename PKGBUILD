# Maintainer: Raphael Bitton <raphael@rbitton.com>
pkgname=worldforge-bin
_pkgname=worldforge
pkgver=0.2.0
pkgrel=1
pkgdesc="A world simulation engine. Simple rules, emergent civilizations, and a narrative that writes itself."
arch=('x86_64')
url="https://git.skylantix.com/hermes/worldforge"
license=('GPL-3.0-or-later')
provides=('worldforge')
conflicts=('worldforge')
source=("worldforge-${pkgver}-linux-amd64::https://git.skylantix.com/api/v4/projects/hermes%2Fworldforge/packages/generic/worldforge/${pkgver}/worldforge-linux-amd64"
        "LICENSE-${pkgver}::https://git.skylantix.com/hermes/worldforge/-/raw/v${pkgver}/LICENSE")
sha256sums=('f4a7a38b11b9da660822d32d8b59e8be37d743c18190770329aae7f6a8e07143' 'bee7ee25f14a0f45a0d36dff8007e82829235938e52a18f2ebafba279a08e5c6')

package() {
    install -Dm755 "worldforge-${pkgver}-linux-amd64" "$pkgdir/usr/bin/worldforge"
    install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
