# Maintainer: Blooser <blooser@protonmail.com>
pkgname=lyra
pkgver=1.7
pkgrel=1
pkgdesc="3D cryptocurrency analyzer with real-time price tracker."
arch=('x86_64')
md5sums=('9aa9ab37df4b66b582009b965d265c0d')
url="https://github.com/blooser/lyra"
license=('MIT')
depends=('python3')
makedepends=('python-setuptools')

source=("https://github.com/blooser/lyra/archive/v${pkgver}.tar.gz")

build() {
	cd $pkgname-$pkgver
	sudo python setup.py install	
}

package() {
	sudo rm -rf $pkgname-$pkgver	
}


