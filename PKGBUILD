# Maintainer: William Tang <galaxyking0419@gmail.com>

pkgname=bricscad-communicator
pkgver=24.2.04
pkgrel=1
pkgdesc="High-fidelity 3D CAD import and export plugin for BricsCAD"
arch=('x86_64')
url='https://www.bricsys.com/communicator'
license=('custom')
depends=('bricscad>=24')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://BricsCAD-Communicator-V${pkgver}-1-amd64.deb")
sha256sums=('50826644d5a7f2067afc1ac08a974e7f29f44e5320bba51807780ccf9b76d380')

options=(!strip)

prepare() {
    tar -xpf data.tar.zst
}

package() {
    mv opt $pkgdir/
}
