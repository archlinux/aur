# Maintainer: FirstAirBender <noblechuk5[at]web[dot]de>
pkgname=find-broken-desktop
pkgver=1.4.0
pkgrel=2
pkgdesc="Find desktop entries files with broken executables.
Similar in functionality to fbrokendesktop, but written in python to avoid some
of the shortcomings of parsing .desktop files with shell scripts"
arch=("any")
license=('MIT')
depends=('python' 'python-pyxdg')
source=("fbrokendesktop.py")
sha256sums=('a7d2278d1710856989eb2d7803042db4b3386e0a7e6d6bf896a5b9ad8020e507')

package() {
    chmod a+x fbrokendesktop.py
    install -D fbrokendesktop.py "$pkgdir/usr/bin/findbrokendesktop"
}
