# Maintainer: Louis Tim Larsen <louis(a)louis.dk>

pkgname=myththeme-mythbuntu
pkgver=28.21
pkgrel=1
curbranch=6539af20b3a83b01b237c32a4492167dbbbee452
pkgdesc="Mythbuntu theme for MythTV"
arch=('any')
url="https://github.com/MythTV-Themes/Mythbuntu"
license=('LGPL')
depends=('mythtv>=0.27' 'ttf-dejavu')
source=("https://github.com/MythTV-Themes/Mythbuntu/archive/"$curbranch".zip")
md5sums=('ce99bbcd52a580af6158f091f8ea31ab')

package() {
	mkdir -p "$pkgdir/usr/share/mythtv/themes/"
	cp -r "$srcdir/Mythbuntu-"$curbranch"" "$pkgdir/usr/share/mythtv/themes/Mythbuntu"
}
