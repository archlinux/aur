# Maintainer: Ramadan Ali <ezqa@ezqa.ny>
pkgname=gnome-console-bin
pkgver=42.2
pkgrel=1
pkgdesc='A simple user-friendly terminal emulator for the GNOME desktop'
arch=('x86_64')
url='https://gitlab.gnome.org/GNOME/console/'
license=('GPL3')
groups=('gnome-extra')
depends=('libgtop' 'libhandy' 'vte3')
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
source=("https://dl.fedoraproject.org/pub/fedora/linux/updates/36/Everything/x86_64/Packages/g/gnome-console-42.2-1.fc36.x86_64.rpm")
sha1sums=("9295dc80fa86bc459695582902cdee7ddb79cdd4")

package() {
	mv $srcdir/usr $pkgdir/usr
	rm -rfv $pkgdir/usr/lib
}
