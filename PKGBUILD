_pkgname=Atolm
pkgname=atolm-openbox-theme
_projectid=144416
pkgver=20110813
pkgrel=1
pkgdesc="$_pkgname Openbox Theme"
arch=('any')
url="http://box-look.org/content/show.php?content=$_projectid"
license=('GPL')
depends=('openbox')
source=("$pkgname-$pkgver.tar.gz::http://box-look.org/CONTENT/content-files/$_projectid-$_pkgname.obt")
md5sums=('fe601ae403ef0a4a7f2a5fea12b0f0e6')

package() {
	cd "$srcdir"
	install -d -o root -g root -m 755 "$pkgdir"/usr/share/themes
	cp -a "$_pkgname" "$pkgdir"/usr/share/themes
	chmod 644 "$pkgdir"/usr/share/themes/"$_pkgname"/openbox-3/*
}

# vim: set ft=sh ts=4 sw=4 noet:
