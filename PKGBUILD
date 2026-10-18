# Maintainer: dexield
pkgname=pacmang
pkgver=1.2.0
pkgrel=1
pkgdesc="Современный графический менеджер пакетов для Arch Linux"
arch=('x86_64')
url="https://github.com/dexield/pacmang"
license=('custom:copyright')
depends=('gtk4' 'libadwaita' 'json-glib')
provides=('pacmang')
conflicts=('pacmang')
options=(!debug !strip)
source=('https://github.com/dexield/pacmang/releases/download/v1.2.0/pacmang'
        'LICENSE')
sha256sums=('2fc456b05521baa5f3a17db64034f54bfee5a38e0e9fb8237d16212ed1a7dfca'
            'SKIP')

package() {
    install -d "$pkgdir/usr/bin"
    install -Dm755 "$srcdir/pacmang" "$pkgdir/usr/bin/pacmang"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

