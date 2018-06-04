# Maintainer: Clayton Craft <clayton@craftyguy.net>
pkgname=autolight
pkgver=1.1
pkgrel=2
pkgdesc="A daemon for controlling display backlight using an ambient light sensor"
arch=('i686' 'x86_64')
url="https://gitlab.com/craftyguy/autolight"
license=('GPL3')
depends=('python' 'light')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://gitlab.com/craftyguy/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('a44267aaa560e696bdcfefd80983cc7d1e439a875bf98ac9d63244401a92c839b668db5367395c59d89b8974bab2d9700ed587df13f068bec3510d8f2062b6bd')
package() {
        cd "$pkgname-$pkgver"
        install -m755 -D "$pkgname" "$pkgdir/usr/bin/$pkgname"
        install -m644 -D "$srcdir/$pkgname-$pkgver/config" "${pkgdir}/etc/$pkgname/config"
}

