# Maintainer: Clayton Craft <clayton@craftyguy.net>
pkgname=autolight
pkgver=1.0
pkgrel=1
pkgdesc="A daemon for controlling display backlight using an ambient light sensor"
arch=('i686' 'x86_64')
url="https://github.com/craftyguy/autolight"
license=('GPL3')
depends=('python' 'light')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://github.com/craftyguy/autolight/archive/${pkgver}.tar.gz")
md5sums=('02ceae3913a3be3f2a612dc129f66c7f')
prepare() {
        cd "$pkgname-$pkgver"
}

build() {
        cd "$pkgname-$pkgver"
}

check() {
        cd "$pkgname-$pkgver"
}

package() {
        cd "$pkgname-$pkgver"
        install -m755 -D "$pkgname" "$pkgdir/usr/bin/$pkgname"
        install -m644 -D "$srcdir/$pkgname-$pkgver/config" "${pkgdir}/etc/$pkgname/config"
}

