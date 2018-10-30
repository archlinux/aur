# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=rebuild-detector
pkgver=2.1.0
pkgrel=1
pkgdesc='Detects which packages need to be rebuilt'
arch=('any')
license=('MIT')
depends=('parallel')
source=('checkrebuild'
        'checkrebuild.sig')
sha256sums=('52d160787fd11d3aafba0102297353f4ed8751437a6ba72d353958b49420c212'
            'SKIP')
validpgpkeys=('EB4F9E5A60D32232BB52150C12C87A28FEAC6B20')

package() {
    install -Dm755 -t "$pkgdir/usr/bin" checkrebuild
}

# vim:set ts=4 sw=4 et:
