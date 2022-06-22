# Maintainer: William Tang <galaxyking0419@gmail.com>

pkgname=bricscad-communicator
pkgver=22.2.02
pkgrel=1
pkgdesc="High-fidelity 3D CAD import and export plugin for BricsCAD"
arch=('x86_64')
url='https://www.bricsys.com/communicator'
license=('custom')
depends=('bricscad>=22' 'libjpeg6-turbo' 'libtool')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://BricsCAD-Communicator-V${pkgver}-1-amd64.deb")
sha256sums=('a21fcaeb99af2e7deda07274c2e496af6e1a1f2c4615619f2e9fb9b1328a244e')

options=(!strip)

prepare() {
    tar -xpf data.tar.xz
}

package() {
    mv opt $pkgdir/
}
