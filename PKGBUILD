# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: XavierCLL

pkgname=python-pympler
_realname_=Pympler
pkgver=0.4.3
pkgrel=1
pkgdesc="A development tool to measure, monitor and analyze the memory behavior of Python objects"
url="http://pypi.python.org/pypi/${_realname_}/"
arch=("any")
license=("Apache")
depends=("python")
source=("http://pypi.python.org/packages/source/P/${_realname_}/${_realname_}-${pkgver}.tar.gz")

build() {
	cd "${srcdir}"/${_realname_}-${pkgver}

	python setup.py build
}

package() {
	cd "${srcdir}"/${_realname_}-${pkgver}

	python setup.py install --root="${pkgdir}/" --optimize=1
	#install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha1sums=('93f38f1b890b21b48955c532903909ecae5bce1b')
