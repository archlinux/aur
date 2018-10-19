# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=rebuild-detector
pkgver=2.0.1
pkgrel=1
pkgdesc='Detects which packages need to be rebuilt'
arch=('any')
license=('MIT')
depends=('parallel')
source=('checkrebuild'
        'checkrebuild.sig')
sha256sums=('27ff575cbba984ed1facd9b2d6c94b4dd8c51af577761270beb20879d2712f46'
            'SKIP')
validpgpkeys=('EB4F9E5A60D32232BB52150C12C87A28FEAC6B20')

package() {
    install -Dm755 -t "$pkgdir/usr/bin" checkrebuild
}

# vim:set ts=4 sw=4 et:
