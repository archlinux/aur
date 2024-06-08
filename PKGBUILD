# Maintainer: FirstAirBender <noblechuk5[at]web[dot]de>
pkgname=find-broken-desktop
pkgver=1.4.0
pkgrel=1
pkgdesc="Find desktop entries files with broken executables.
Similar in functionality to fbrokendesktop, but written in python to avoid some
of the shortcomings of parsing .desktop files with shell scripts"
arch=("any")
license=('MIT')
depends=('python' 'python-pyxdg')
source=("fbrokendesktop.py")
sha256sums=('13de1ad629d3c5b4b48900c7e375755a3cee41b8c89dd5c4463f056283416b2a')

package() {
    chmod a+x fbrokendesktop.py
    install -D fbrokendesktop.py "$pkgdir/usr/bin/findbrokendesktop"
}
