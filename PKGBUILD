# Maintainer: Stuart Mumford <stuart at cadair dot com>
pkgname=paraview-bin
pkgver=4.3.1
pkgrel=1
pkgdesc="ParaView is an open-source, multi-platform data analysis and visualization application. This package installs the binary build from the kitware website."
arch=('x86_64')
url="http://www.paraview.org/"
license=('BSD')
depends=()
checkdepends=()
optdepends=()
source=("http://paraview.org/files/v${pkgver:0:3}/ParaView-${pkgver}-Linux-64bit-glibc-2.3.6.tar.gz")
noextract=()
md5sums=(86ca04f5064f2b4b940158848216bf8e)

package() {
	cp -r "${srcdir}/ParaView-$pkgver-Linux-64bit" "${pkgdir}/usr"
}
