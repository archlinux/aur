# Maintainer: Kalentia <kalentia.git@gmail.com>
pkgname=xcursor-alkano-default
pkgver=1
pkgrel=1
pkgdesc="Alkano cursor - default variant"
arch=('any')
url="https://www.gnome-look.org/p/1099962/"
source=("https://www.dropbox.com/s/blps54ojd81yh73/Alkano.tgz")
makedepends=('tar')

sha256sums=('SKIP')

package() {
	cd $srcdir/Alkano
	install -d $pkgdir/usr/share/icons/Alkano
	cp -rf * $pkgdir/usr/share/icons/Alkano
	chmod -R 644 $pkgdir/usr/share/icons/Alkano/*
	chmod 755 $pkgdir/usr/share/icons/Alkano
	chmod 755 $pkgdir/usr/share/icons/Alkano/cursors
}
