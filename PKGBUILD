# Maintainer: Thanos Apostolou <thanos@manjaro.org>

pkgname=cesious-theme
pkgver=1.3
pkgrel=1
pkgdesc="Cesious theme for awesome wm"
arch=(any)
url="https://gitlab.com/ThanosApostolou/$pkgname"
license=(MIT)
depends=('awesome')
optdepends=('adapta-gtk-theme'
            'noto-fonts')
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('36fe365ff6c02400d3170718c8a1eb07')

package () {
	cd "$pkgname-$pkgver"
	install -dm755 $pkgdir/usr/share/awesome/themes/
	cp -r ./cesious $pkgdir/usr/share/awesome/themes/
}
