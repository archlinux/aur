# Maintainer: FirstAirBender <noblechuk5[at]web[dot]de>
pkgname=find-broken-desktop
pkgver=1.3
pkgrel=3
pkgdesc="Find desktop entries files with broken executables.
Similar in functionality to fbrokendesktop, but written in python to avoid some
of the shortcomings of parsing .desktop files with shell scripts"
arch=("any")
license=('MIT')
depends=('python' 'python-pyxdg')
source=("fbrokendesktop.py")
sha256sums=('844a5dc47575df7282877fab95a972c0d763d3832a10adc4bf3cf112e8900db1')

package() {
    chmod a+x fbrokendesktop.py
    install -D fbrokendesktop.py "$pkgdir/usr/bin/findbrokendesktop"
}
