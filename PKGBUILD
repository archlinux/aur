# Maintainer: FirstAirBender <noblechuk5[at]web[dot]de>
pkgname=find-broken-desktop
pkgver=1.0
pkgrel=1
pkgdesc="Find .desktop files with invalid executables"
arch=("any")
license=('MIT')
depends=('python' 'python-pyxdg')
source=("fbrokendesktop.py")
sha256sums=('0e47961fec8f6751c695d31952a652cdc29fdbc7e7aef68c708bd40404668cc2')

package() {
	chmod +x fbrokendesktop.py
	install -D fbrokendesktop.py "$pkgdir/usr/bin/findbrokendesktop"
}
