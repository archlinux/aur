# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: XavierCLL

pkgname=python-pympler
_realname_=Pympler
pkgver=0.5
pkgrel=1
pkgdesc="A development tool to measure, monitor and analyze the memory behavior of Python objects"
url="http://pypi.python.org/pypi/${_realname_}/"
arch=("any")
license=("Apache")
depends=("python")
source=("https://pypi.python.org/packages/9e/4b/04c8338a9a2a22645ada1d52c59df2b81d644400f6cca10f63072e5f60cd/${_realname_}-${pkgver}.tar.gz")

build() {
	cd "${srcdir}"/${_realname_}-${pkgver}

	python setup.py build
}

package() {
	cd "${srcdir}"/${_realname_}-${pkgver}

	python setup.py install --root="${pkgdir}/" --optimize=1
	#install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha1sums=('227d47d25a3cbd46f08ffb8ed5520fa9566ba43a')
