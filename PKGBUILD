# Maintainer: FirstAirBender <noblechuk5[at]web[dot]de>
pkgname=find-broken-desktop
pkgver=1.3
pkgrel=1
pkgdesc="Find desktop entries files with broken executables.
Similar in functionality to fbrokendesktop, but written in python to avoid some
of the shortcomings of parsing .desktop files with shell scripts"
arch=("any")
license=('MIT')
depends=('python' 'python-pyxdg')
source=("fbrokendesktop.py")
sha256sums=('27cb59808bf8245041962a3fc576bb33a3d911745901c583694d77fbf44720e5')

package() {
    chmod +x fbrokendesktop.py
    install -D fbrokendesktop.py "$pkgdir/usr/bin/findbrokendesktop"
}
