# Maintainer: FirstAirBender <noblechuk5[at]web[dot]de>
pkgname=find-broken-desktop
pkgver=1.1
pkgrel=1
pkgdesc="Find desktop entries files with broken executables.
Similar in functionality to fbrokendesktop, but written in python to avoid some
of the shortcomings of parsing .desktop files with shell scripts"
arch=("any")
license=('MIT')
depends=('python' 'python-pyxdg')
source=("fbrokendesktop.py")
sha256sums=('19dbbfa65de50731d9b069f48820a9ff4d4d9bd47d040b82a0757a99803f91fd')

package() {
	chmod +x fbrokendesktop.py
	install -D fbrokendesktop.py "$pkgdir/usr/bin/findbrokendesktop"
}
