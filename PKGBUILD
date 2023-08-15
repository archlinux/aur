# Maintainer: William Tang <galaxyking0419@gmail.com>

pkgname=bricscad-communicator
pkgver=23.1.05
pkgrel=1
pkgdesc="High-fidelity 3D CAD import and export plugin for BricsCAD"
arch=('x86_64')
url='https://www.bricsys.com/communicator'
license=('custom')
depends=('bricscad>=23' 'libjpeg6-turbo' 'libtool')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://BricsCAD-Communicator-V${pkgver}-1-amd64.deb")
sha256sums=('635cafcb9cf310fc363c6925d2e4b07caa07eef122772afd587e44020b75fc3a')

options=(!strip)

prepare() {
    tar -xpf data.tar.xz
}

package() {
    mv opt $pkgdir/
}
