# Maintainer: Louis Tim Larsen <louis(a)louis.dk>

pkgname=myththeme-mythbuntu
pkgver=28.20
pkgrel=2
pkgdesc="Mythbuntu theme for MythTV"
arch=('any')
url="https://github.com/MythTV-Themes/Mythbuntu"
license=('LGPL')
depends=('mythtv>=0.27' 'ttf-dejavu')
source=("https://github.com/MythTV-Themes/Mythbuntu/archive/master.zip")
md5sums=('cf4f2911860ddf60403c45685241b60f')

package() {
	mkdir -p "$pkgdir/usr/share/mythtv/themes/"
	cp -r "$srcdir/Mythbuntu-master" "$pkgdir/usr/share/mythtv/themes/Mythbuntu"
}
