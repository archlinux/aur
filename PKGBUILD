# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=rebuild-detector
pkgver=2.1.0
pkgrel=3
pkgdesc='Detects which packages need to be rebuilt'
arch=('any')
license=('MIT')
depends=('parallel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/maximbaz/$pkgname/releases/download/$pkgver/$pkgname.tar.gz"
        "$pkgname-$pkgver.tar.gz.sig::https://github.com/maximbaz/$pkgname/releases/download/$pkgver/$pkgname.tar.gz.sig")
sha256sums=('60a7495eb05d223c461c43dbee9fbf46cf32c698e1950cfcc7dcb0d30f12292a'
            'SKIP')
validpgpkeys=('EB4F9E5A60D32232BB52150C12C87A28FEAC6B20')

package() {
    install -Dm755 -t "$pkgdir/usr/bin" checkrebuild
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim:set ts=4 sw=4 et:
