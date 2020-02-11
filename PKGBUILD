# Maintainer: Isaac Freund <ifreund@ifreund.xyz>

pkgname=cozette-otb
pkgver=1.3.1
pkgrel=1
pkgdesc='A bitmap programming font optimized for coziness'
arch=('any')
url='https://github.com/slavfox/Cozette'
license=('MIT')
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/slavfox/Cozette/releases/download/v.$pkgver/cozette.otb"
        "https://github.com/slavfox/Cozette/archive/v.$pkgver.tar.gz")
sha256sums=('35764cd2e7dcab578bf55a7a85f392f66635b232e03fe5e29fb4aa6e54e651cf'
            '09026d3c9b68cf1ad941b8158cddee6daebd4c4bd845c853c2c9b5ed69ca4c69')

package() {
    install -D -m0644 "$srcdir/cozette.otb" "$pkgdir/usr/share/fonts/misc/cozette.otb"
    install -D -m0644 "$srcdir/Cozette-v.$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
