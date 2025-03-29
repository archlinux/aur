# Maintainer: Giovanni Santini <giovannisantini93@yahoo.it>
# Previous maintainer: Daniel Apolinario <dapolinario@gmail.com>
# Contributor: Roman Timushev <romikt@gmail.com>
pkgname=gnome-defaults-list
pkgver=47.0.1
pkgrel=2
pkgdesc="Default file associations for GNOME environment"
url="https://tracker.debian.org/pkg/gnome-session"
arch=(any)
license=(GPL LGPL)
source=("https://deb.debian.org/debian/pool/main/g/gnome-session/gnome-session_${pkgver}-${pkgrel}.debian.tar.xz")
# Old Ubuntu source
#_ubuntuver=0ubuntu5
#source=(http://archive.ubuntu.com/ubuntu/pool/main/g/gnome-session/gnome-session_${pkgver}-${_ubuntuver}.debian.tar.xz)
sha256sums=('47e3f61915d77595fd47ec587312c8d76f8e98062f8665238dd1c7f36172f080')

package() {
	install -d "$pkgdir/usr/share/applications"
	#install -d "$pkgdir/etc/gnome"

	cp "$srcdir/debian/gnome-mimeapps.list" "$pkgdir/usr/share/applications/"
	#ln -s "$pkgdir/usr/share/applications/gnome-mimeapps.list" "/etc/gnome/defaults.list"
	#sed -i "s/libreoffice\-//g" $pkgdir/etc/gnome/defaults.list
}
