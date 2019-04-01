# Maintainer: Blooser <blooser@protonmail.com>
pkgname=lyra
pkgver=1.7.1
pkgrel=1
pkgdesc="3D cryptocurrency analyzer with real-time price tracker."
arch=('x86_64')
md5sums=('c382b3be9000f14e8212a2875c093ba9')
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

