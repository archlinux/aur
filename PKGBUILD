# Maintainer: Alexander 'z33ky' Hirsch <1zeeky@gmail.com>

pkgname=python-requests-futures
pkgver=0.9.7
pkgrel=2
pkgdesc='Asynchronous Python HTTP for Humans.'
license=('Apache')
arch=('any')
url='https://github.com/ross/requests-futures'
depends=('python-requests')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/r/requests-futures/requests-futures-${pkgver}.tar.gz")
sha256sums=('a9ca2c3480b6fac29ec5de59c146742e2ab2b60f8c68581766094edb52ea7bad')

package() {
	cd "${srcdir}/requests-futures-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1
}
