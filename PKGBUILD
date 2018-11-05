# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=rebuild-detector
pkgver=2.1.0
pkgrel=2
pkgdesc='Detects which packages need to be rebuilt'
arch=('any')
license=('MIT')
depends=('parallel')
source=('checkrebuild'
        'checkrebuild.sig'
        'LICENSE')
sha256sums=('52d160787fd11d3aafba0102297353f4ed8751437a6ba72d353958b49420c212'
            'SKIP'
            '4db14647c2d687192ad26c2d4dbc7f2fd03136c3dee67720ebbbbb6c3ebc1d4e')
validpgpkeys=('EB4F9E5A60D32232BB52150C12C87A28FEAC6B20')

package() {
    install -Dm755 -t "$pkgdir/usr/bin" checkrebuild
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim:set ts=4 sw=4 et:
