# Contributor: Thanos Apostolou <thanos@manjaro.org>

pkgname=cesious-theme
pkgver=1.5
pkgrel=1
pkgdesc="Cesious theme for awesome wm"
arch=(any)
url="https://gitlab.com/ThanosApostolou/$pkgname"
license=(MIT)
depends=('awesome')
optdepends=('adapta-gtk-theme'
            'noto-fonts')
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('bf693f4718766aef70c4a9bf70af73c407eeb99ff78d156b8d86778adce3b47aafd2381a1d113d4c52f8cb189f23617bf2263eba31ea9f7a3f04b1cb759cae3b')

package () {
	cd "$pkgname-$pkgver"
	install -dm755 $pkgdir/usr/share/awesome/themes/
	cp -r ./cesious $pkgdir/usr/share/awesome/themes/
}
