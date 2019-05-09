# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: XavierCLL

pkgname=python-pympler
_realname_=Pympler
pkgver=0.7
pkgrel=1
pkgdesc="A development tool to measure, monitor and analyze the memory behavior of Python objects"
url="https://pypi.org/project/${_realname_}/"
arch=("any")
license=("Apache")
depends=("python")
source=("https://files.pythonhosted.org/packages/31/0a/646bbf701678213de5497d82e5bac24297bbffb333d1f8300cfc43329fa6/${_realname_}-${pkgver}.tar.gz")

build() {
	cd "${srcdir}"/${_realname_}-${pkgver}

	python setup.py build
}

package() {
	cd "${srcdir}"/${_realname_}-${pkgver}

	python setup.py install --root="${pkgdir}/" --optimize=1
	#install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha1sums=('1cab1aab73631aa6fae6838bc1b6a7c78c12b21e')
