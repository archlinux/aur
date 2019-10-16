# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=rebuild-detector
pkgver=2.2.0
pkgrel=1
pkgdesc='Detects which packages need to be rebuilt'
arch=('any')
url="https://github.com/maximbaz/$pkgname"
license=('MIT')
depends=('parallel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/maximbaz/$pkgname/releases/download/$pkgver/$pkgname.tar.gz"
        "$pkgname-$pkgver.tar.gz.sig::https://github.com/maximbaz/$pkgname/releases/download/$pkgver/$pkgname.tar.gz.sig")
sha256sums=('c439d591189e4484ea345754e5ccf8197c79d008a985e7f92c9df42f8f4ff102'
            'SKIP')
validpgpkeys=('EB4F9E5A60D32232BB52150C12C87A28FEAC6B20')

package() {
    install -Dm755 -t "$pkgdir/usr/bin" checkrebuild
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim:set ts=4 sw=4 et:
