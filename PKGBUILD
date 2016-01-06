# Maintainer: Bernhard Landauer <oberon@manjaro.org>
pkgname=adwaita-graphene-gtk-theme
pkgver=20150106
pkgrel=1
_snapshot=96cd71cfccdf3869cb2fe85798e3831558185cfa
pkgdesc="Grey gtk2 and gtk3 theme"
url="https://github.com/oberon2007/$pkgname"
license=('GPL')
arch=('any')
depends=('gtk-engines')
source="$pkgname-$pkgver.tar.gz::$url/archive/$_snapshot.tar.gz"
md5sums=('7d61e553b9d3228da79884929107b702')

package() {
	cd $pkgname-$_snapshot
	mkdir -p $pkgdir/usr/share/themes
	cp -r * $pkgdir/usr/share/themes
}
