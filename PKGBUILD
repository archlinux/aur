# Maintainer: the-traveler <you@example.com>
pkgname=spinwheel-base
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple terminal wheel spinner. no modes, no dependencies, no frills."
arch=('any')
url="https://codeberg.org/the-traveler/spinwheel"
license=('GPL-3.0-or-later')
depends=('lua')
groups=('spinwheel')
conflicts=('spinwheel' 'spinwheel-pulse')
provides=('spinwheel')
source=("spinwheel.lua")
sha256sums=('SKIP')

package() {
    install -Dm755 "$srcdir/spinwheel.lua" "$pkgdir/usr/bin/spinwheel"
}
