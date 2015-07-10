# Maintainer: Troy C < rstrox -ta yahoo -tod com >

pkgname=python-rax-scheduled-images-python-novaclient-ext
pkgver=0.3.1
pkgrel=1
pkgdesc="Extends python-novaclient to use RAX-SI, the Rackspace Nova API Scheduled Images extension"
arch=('any')
url="http://pypi.python.org/pypi/rax_scheduled_images_python_novaclient_ext"
license=('GPL')
depends=('python-novaclient')
makedepends=('python-setuptools')
provides=("$pkgname=$pkgver")
source=(http://pypi.python.org/packages/source/r/rax_scheduled_images_python_novaclient_ext/rax_scheduled_images_python_novaclient_ext-${pkgver}.tar.gz)
md5sums=('14c28fc2a3627b1a2cef6cee537d7e84')

build() {
	cd "$srcdir/rax_scheduled_images_python_novaclient_ext-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/rax_scheduled_images_python_novaclient_ext-$pkgver"
	python setup.py install --root=${pkgdir}
}
