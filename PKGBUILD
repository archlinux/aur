# Maintainer: Bernhard Landauer <oberon@manjaro.org>
pkgname=adwaita-graphene-gtk-theme
pkgver=20160212
pkgrel=1
_snapshot=b4ab477091ecec8b16ca529f9b08e8cb8340f57d
pkgdesc="Grey gtk2 and gtk3 theme"
url="https://github.com/oberon2007/$pkgname"
license=('GPL')
arch=('any')
depends=('gtk-engines')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_snapshot.tar.gz")
md5sums=('e0e0b343d1713fdaaf1c2051fdea080c')

package() {
	cd $pkgname-$_snapshot
	mkdir -p $pkgdir/usr/share/themes
	cp -r * $pkgdir/usr/share/themes
}
