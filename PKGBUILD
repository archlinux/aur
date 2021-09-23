# Maintainer: Giovanni Santini <giovannisantini93@yahoo.it>
# Previous maintainer: Daniel Apolinario <dapolinario@gmail.com>
# Contributor: Roman Timushev <romikt@gmail.com>
pkgname=gnome-defaults-list
pkgver=40.1.1
pkgrel=1
pkgdesc="Default file associations for GNOME environment"
#_ubuntuver=0ubuntu5
# If following upstream, use:
_pkgrel=$pkgrel
# Else use a custom value
#_pkgrel=2
arch=(any)
#url="http://packages.ubuntu.com/source/gnome-session"
url="https://tracker.debian.org/pkg/gnome-session"
license=(GPL LGPL)
#source=(http://archive.ubuntu.com/ubuntu/pool/main/g/gnome-session/gnome-session_${pkgver}-${_ubuntuver}.debian.tar.xz)
source=(https://deb.debian.org/debian/pool/main/g/gnome-session/gnome-session_$pkgver-$_pkgrel.debian.tar.xz)
sha256sums=('58ec8b4b5c6b5bb69749ce46032cbf6e10c48afc92e758a71b2b6d9042aa8680')

package() {
	#install -d "$pkgdir/etc/gnome"
	install -d "$pkgdir/usr/share/applications"
	# sed -i "s/libreoffice\-//g" $pkgdir/etc/gnome/defaults.list
	cp "$srcdir/debian/gnome-mimeapps.list" "$pkgdir/usr/share/applications/"
	#ln -s "$pkgdir/usr/share/applications/gnome-mimeapps.list" "/etc/gnome/defaults.list"
}

