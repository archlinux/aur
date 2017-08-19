# Maintainer: Felix Barz <skycoder42.de@gmx.de>
pkgname=conflip
pkgver=1.0.1
pkgrel=2
pkgdesc="A tool to synchronize settings/configurations across multiple machines"
arch=('i686' 'x86_64')
url="https://github.com/Skycoder42/Conflip"
license=('BSD')
depends=('qt5-base' 'qt5-datasync')
source=("https://install.skycoder42.de/pkg/${pkgname}-${pkgver}.tar.xz")
sha256sums=('7df165d6bb488b693e5f985d31324a28df381555e01e1150a82912cf7465554a')

package() {
	#create symlink to prevent settings LD_LIBRARY_PATH
	ln -s /usr/bin/conflip ./usr/lib
	
	cp -r ./usr "$pkgdir/"
}
