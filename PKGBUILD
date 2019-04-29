# Maintainer: Giovanni Santini <giovannisantini93@yahoo.it>
# Previous maintainer: Daniel Apolinario <dapolinario@gmail.com>
# Contributor: Roman Timushev <romikt@gmail.com>
pkgname=gnome-defaults-list
pkgver=3.32.0
pkgrel=1
pkgdesc="Default file associations for GNOME environment"
#_ubuntuver=0ubuntu5
_pkgrel=1
arch=(any)
#url="http://packages.ubuntu.com/source/gnome-session"
url="https://tracker.debian.org/pkg/gnome-session"
license=(GPL LGPL)
#source=(http://archive.ubuntu.com/ubuntu/pool/main/g/gnome-session/gnome-session_${pkgver}-${_ubuntuver}.debian.tar.xz)
source=(https://deb.debian.org/debian/pool/main/g/gnome-session/gnome-session_$pkgver-$_pkgrel.debian.tar.xz)
sha256sums=('ccf8ab04b48b744977e9612090b3c71a3918e0ccd17c6fbfaddb3c4802f352e0')

package() {
	#install -d "$pkgdir/etc/gnome"
	install -d "$pkgdir/usr/share/applications"
	# sed -i "s/libreoffice\-//g" $pkgdir/etc/gnome/defaults.list
	cp "$srcdir/debian/gnome-mimeapps.list" "$pkgdir/usr/share/applications/"
	#ln -s "$pkgdir/usr/share/applications/gnome-mimeapps.list" "/etc/gnome/defaults.list"
}

