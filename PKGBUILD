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
source=("$pkgname-$pkgver.tar.gz::https://dl.opendesktop.org/api/files/download/id/1460768348/s/b78e216c2b4c7fc2b9428db8193b44df41823f5a45efec9a1bfebf74012d08017a33b09f9437e9f40d671e91171ae27fc873695b0cff88dd56566e35065a6827/t/1548983943/u/$_projectid-$_pkgname.obt")
md5sums=('fe601ae403ef0a4a7f2a5fea12b0f0e6')

package() {
	cd "$srcdir"
	mkdir -p "$pkgdir"/usr/share/themes
	cp -Rp "$_pkgname" "$pkgdir"/usr/share/themes
	chmod 644 "$pkgdir"/usr/share/themes/"$_pkgname"/openbox-3/*
}

# vim: set ft=sh ts=4 sw=4 noet:
