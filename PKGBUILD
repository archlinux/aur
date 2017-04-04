# Maintainer: Giovanni Santini <giovannisantini93@yahoo.it>
# Previous maintainer: Daniel Apolinario <dapolinario@gmail.com>
# Contributor: Roman Timushev <romikt@gmail.com>
pkgname=gnome-defaults-list
pkgver=3.24.0
pkgrel=1
pkgdesc="default file associations for GNOME environment"
_ubuntuver=0ubuntu1
arch=('any')
url="http://packages.ubuntu.com/source/gnome-session"
license=('GPL' 'LGPL')
source=(http://archive.ubuntu.com/ubuntu/pool/main/g/gnome-session/gnome-session_${pkgver}-${_ubuntuver}.debian.tar.xz)
sha1sums=('c8970c1b0987c53beb879463e3257d61bae95aa6')

package() {
	#install -d "$pkgdir/etc/gnome"
	install -d "$pkgdir/usr/share/applications"
	# sed -i "s/libreoffice\-//g" $pkgdir/etc/gnome/defaults.list
	cp "$srcdir/debian/gnome-mimeapps.list" "$pkgdir/usr/share/applications/"
	#ln -s "$pkgdir/usr/share/applications/gnome-mimeapps.list" "/etc/gnome/defaults.list"
}

