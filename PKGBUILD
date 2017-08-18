# Maintainer: Felix Barz <skycoder42.de@gmx.de>
pkgname=conflip
pkgver=1.0.1
pkgrel=1
pkgdesc="A tool to synchronize settings/configurations across multiple machines"
arch=('i686' 'x86_64')
url="https://github.com/Skycoder42/Conflip"
license=('BSD')
depends=('qt5-base' 'qt5-datasync')
source=("https://install.skycoder42.de/pkg/${pkgname}-${pkgver}.tar.xz")
sha256sums=('56385fe73d85be0272067e92c3e8f97268a4d13f13e58e3a4b50277cabb950d1')

package() {
	#create symlink to prevent settings LD_LIBRARY_PATH
	ln -s /usr/bin/conflip ./usr/lib
	
	cp -r ./usr "$pkgdir/"
}
