# Maintainer: Charles Vejnar <first name [dot] last name [at] gmail [dot] com>

pkgname=python-aiohttp-autoreload
pkgver=0.0.1
pkgrel=1
pkgdesc="Makes aiohttp server autoreload on source code change."
arch=("any")
url="https://github.com/anti1869/aiohttp_autoreload"
license=("Apache")
depends=("python")
makedepends=("python-setuptools")
source=("https://github.com/anti1869/aiohttp_autoreload/archive/master.zip")
sha1sums=("2bfab4de574c8c298336d3138da06e3de257c214")

build() {
    cd $srcdir/aiohttp_autoreload-master
    python setup.py build
}

package() {
    cd $srcdir/aiohttp_autoreload-master
    python setup.py install --root="$pkgdir" --optimize=1
}
