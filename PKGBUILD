# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-peewee-migrate"
pkgver=1.4.7
pkgrel=1
pkgdesc="Simple migration engine for Peewee"
url="https://github.com/klen/peewee_migrate"
license=("BSD3")
arch=("any")
depends=("python-peewee")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('9cdead1cbd1c5aa947f18af48e98343e308f0201147d3c81d4c227c55728eecf')
options=("!strip")

build(){
 cd "peewee_migrate-$pkgver"
 python setup.py build
}

package(){
 cd "peewee_migrate-$pkgver"
 python setup.py install --root="$pkgdir" --optimize=1
}
