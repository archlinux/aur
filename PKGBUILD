# Maintainer: Ramadan Ali <ezqa@ezqa.ny>
pkgname=gnome-console-bin
pkgver=42.beta
pkgrel=1
pkgdesc='A simple user-friendly terminal emulator for the GNOME desktop'
arch=('x86_64')
url='https://gitlab.gnome.org/GNOME/console/'
license=('GPL3')
groups=('gnome-extra')
depends=('libgtop' 'libhandy' 'vte3')
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
source=("https://dl.fedoraproject.org/pub/fedora/linux/releases/36/Everything/x86_64/os/Packages/g/gnome-console-42~beta-1.fc36.x86_64.rpm")
sha1sums=("90fb4955dd36d7fbb5e5d57f3c426113bf917000")

package() {
	mv $srcdir/usr $pkgdir/usr
	rm -rfv $pkgdir/usr/lib
}
