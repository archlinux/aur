# Maintainer: Marius Nestor <marius AT softpedia dot com>

pkgname=pacifica-icon-theme
pkgver=31.10.2013
pkgrel=3
pkgdesc="Pacifica icon theme by bokehlicia"
url="http://bokehlicia.deviantart.com/art/Pacifica-Icons-402508559"
source=("http://fc02.deviantart.net/fs70/f/2013/304/8/5/pacifica_icons_by_bokehlicia-d6nn5lb.zip")
md5sums=('5a0d03777f06ee79d8de05b3ad669087')
license=('GPL')
arch=('any')
depends=('elementary-icon-theme')

package() {
	mkdir -p $pkgdir/usr/share/icons
	cp -raf $srcdir/Pacifica* $pkgdir/usr/share/icons/
	chown -R root:root "$pkgdir"/usr
	chmod 0644 "$pkgdir"/usr/share/icons/Pacifica/{index.theme,CREDITS}
}

