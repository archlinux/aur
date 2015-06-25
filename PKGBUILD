# Maintainer: Troy C < rstrox -ta yahoo -tod com >

pkgname=python2-rax-scheduled-images-python-novaclient-ext
pkgver=0.2.2
pkgrel=1
pkgdesc="Extends python-novaclient to use RAX-SI, the Rackspace Nova API Scheduled Images extension"
arch=('any')
url="http://pypi.python.org/pypi/rax_scheduled_images_python_novaclient_ext"
license=('GPL')
depends=('python2-novaclient')
makedepends=('python2-setuptools')
provides=("$pkgname=$pkgver")
source=(http://pypi.python.org/packages/source/r/rax_scheduled_images_python_novaclient_ext/rax_scheduled_images_python_novaclient_ext-${pkgver}.tar.gz)
md5sums=('9d9507aa4b42164169c62ee2057ece08')

build() {
	cd "$srcdir/rax_scheduled_images_python_novaclient_ext-$pkgver"
	python2 setup.py build
}

package() {
	cd "$srcdir/rax_scheduled_images_python_novaclient_ext-$pkgver"
	python2 setup.py install --root=${pkgdir}
}
