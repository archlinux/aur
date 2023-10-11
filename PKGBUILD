# Maintainer: FirstAirBender <noblechuk5[at]web[dot]de>
pkgname=find-broken-desktop
pkgver=1.2
pkgrel=1
pkgdesc="Find desktop entries files with broken executables.
Similar in functionality to fbrokendesktop, but written in python to avoid some
of the shortcomings of parsing .desktop files with shell scripts"
arch=("any")
license=('MIT')
depends=('python' 'python-pyxdg')
source=("fbrokendesktop.py")
sha256sums=('bafb74744da76aefae86525aac2c9a42aa488a5dfd291ca49ecb6c2861a45f1c')

package() {
	chmod +x fbrokendesktop.py
	install -D fbrokendesktop.py "$pkgdir/usr/bin/findbrokendesktop"
}
