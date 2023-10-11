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
sha256sums=('3c86df99ebf6958f8266f650516ec55b1e452a21ae76f295fb43eb03be181c9d')

package() {
	chmod +x fbrokendesktop.py
	install -D fbrokendesktop.py "$pkgdir/usr/bin/findbrokendesktop"
}
