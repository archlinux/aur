# Maintainer: Igor Yanchenko <yanchenko.igor@gmail.com>
pkgname=python-etcd
pkgver=0.4.5
pkgrel=1
pkgdesc="A python client for etcd"
arch=("any")
url="http://github.com/jplana/python-etcd"
license=('MIT')
source=("https://files.pythonhosted.org/packages/a1/da/616a4d073642da5dd432e5289b7c1cb0963cc5dde23d1ecb8d726821ab41/python-etcd-0.4.5.tar.gz")
md5sums=("a636872dcaf5595ec6f71c83322b9924")


build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
