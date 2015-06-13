pkgname=bmpanel2-elementary-theme
_projectid=124796
pkgver=20100515
pkgrel=1
pkgdesc="A matching bmpanel2 theme for elementary gtk2 & openbox themes"
arch=('any')
url="http://box-look.org/content/show.php/?content=$_projectid"
license=('GPL')
depends=('bmpanel2')
source=("$pkgname-$pkgver.tar.gz::http://box-look.org/CONTENT/content-files/$_projectid-elementary.tar.gz")
md5sums=('3974aeb77c0c1b38b7dac12f36960b9e')

package() {
	cd "$srcdir"

	mkdir -p "$pkgdir/usr/share/bmpanel2/themes"
	cp -a "elementary" "$pkgdir/usr/share/bmpanel2/themes"
}

# vim: set ft=sh ts=4 sw=4 noet:
