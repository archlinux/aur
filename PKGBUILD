# Maintainer: Kalentia <kalentia.git@gmail.com>
pkgname=xcursor-alkano-default
pkgver=3.2.0
pkgrel=1
pkgdesc="Alkano cursor - default variant"
arch=('any')
url="https://www.gnome-look.org/p/999965/"
source=("https://www.dropbox.com/s/blps54ojd81yh73/Alkano.tgz")
makedepends=('tar')
sha256sums=('6d3ca78ec27787f7ddbdef7fd05eeb55cacbdc09ac2d1c5b85034e0cfb148495')

package() {
	cd $srcdir/Alkano
	install -d $pkgdir/usr/share/icons/Alkano
	cp -rf * $pkgdir/usr/share/icons/Alkano
	chmod -R 644 $pkgdir/usr/share/icons/Alkano/*
	chmod 755 $pkgdir/usr/share/icons/Alkano
	chmod 755 $pkgdir/usr/share/icons/Alkano/cursors
}
