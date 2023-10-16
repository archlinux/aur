# Maintainer: Antonio Arias Orzanco <antonio dot arias99999 at gmail dot com>

pkgname=python-zenlog
pkgver=1.1
pkgrel=1
pkgdesc="Python logging tool for lazy people."
arch=('any')
url="https://github.com/ManufacturaInd/python-zenlog"
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ManufacturaInd/python-zenlog/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('1f26f594e5ad5db579af19352b71a10c')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --skip-build --optimize=1
}

