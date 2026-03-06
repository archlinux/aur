# Maintainer: the-traveler <you@example.com>
pkgname=spinwheel-pipewire
pkgver=0.1.0
pkgrel=1
pkgdesc="A terminal wheel spinner with named wheels and built-in modes"
arch=('any')
url="https://codeberg.org/the-traveler/spinwheel"
license=('GPL-3.0-or-later')
depends=('luajit' 'pipewire')
groups=('spinwheel')
source=("spinwheel.lua"
        "spinwheel.1")
sha256sums=('SKIP'
            'SKIP')

package() {
    install -Dm755 "$srcdir/spinwheel.lua" "$pkgdir/usr/bin/spinwheel"
    install -Dm644 "$srcdir/spinwheel.1"   "$pkgdir/usr/share/man/man1/spinwheel.1"
}
