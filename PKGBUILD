# Maintainer: FirstAirBender <noblechuk5[at]web[dot]de>
pkgname=find-broken-desktop
pkgver=1.3
pkgrel=2
pkgdesc="Find desktop entries files with broken executables.
Similar in functionality to fbrokendesktop, but written in python to avoid some
of the shortcomings of parsing .desktop files with shell scripts"
arch=("any")
license=('MIT')
depends=('python' 'python-pyxdg')
source=("fbrokendesktop.py")
sha256sums=('af8bfb0d6d587beeafea67a528b638a20f76eb436ce9fa9a89e8a0161ab2ec71')

package() {
    chmod +x fbrokendesktop.py
    install -D fbrokendesktop.py "$pkgdir/usr/bin/findbrokendesktop"
}
