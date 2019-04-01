# Maintainer: Blooser <blooser@protonmail.com>
pkgname=cygnus
pkgver=1.4.1
pkgrel=1
pkgdesc="Effortless RSS reader."
arch=('x86_64')
md5sums=('5545c2d83e637f26d1366c96e80338b3')
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
	sudo rm -rf $pkgname-$pkgver	
}

