# Maintainer: Devaev Maxim <mdevaev@gmail.com>


pkgname=python-pyghmi
pkgver=1.3.0
pkgrel=1
pkgdesc="A Pure python IPMI library"
url="https://github.com/openstack/pyghmi"
license=("Apache 2.0")
arch=(any)
depends=(python-cryptography)
makedepends=(gcc python-distribute)
source=("$url/archive/$pkgver.tar.gz")
md5sums=(SKIP)


package() {
	cd "$srcdir/pyghmi-$pkgver"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
