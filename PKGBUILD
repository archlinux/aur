# Maintainer: Felix Barz <skycoder42.de@gmx.de>
pkgname=conflip
pkgver=1.0.0
pkgrel=1
pkgdesc="A tool to synchronize settings/configurations across multiple machines"
arch=('i686' 'x86_64')
url="https://github.com/Skycoder42/Conflip"
license=('BSD')
depends=('qt5-base' 'qt5-datasync')
source=("https://install.skycoder42.de/pkg/${pkgname}-${pkgver}.tar.xz")
sha256sums=('f55c55068537940b8fc2cb68279872027d6912b1ad4481e13e04a759e1c90f4c')

package() {
	cp -r ./usr "$pkgdir/"
}
