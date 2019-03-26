# Maintainer: Blooser <blooser@protonmail.com>
pkgname=cygnus
pkgver=1.4
pkgrel=1
pkgdesc="Effortless RSS reader."
arch=('x86_64')
md5sums=('e2e6d601ca30397714fb08c9ca33c56c')
url="https://github.com/blooser/cygnus"
license=('MIT')
depends=('python3')
makedepends=('python-setuptools')

source=("https://github.com/blooser/cygnus/archive/v${pkgver}.tar.gz")

build() {
	cd $pkgname-$pkgver
	sudo python setup.py install	
}

package() {
	cd $pkgname-$pkgver
	sudo rm -rf $pkgname-$pkgver
	cd ..
	sudo rm -rf $pkgname-$pkgver	
}

