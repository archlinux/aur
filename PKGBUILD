# Maintainer: Maximilian Stahlberg <maximilian.stahlberg tu-berlin de>

pkgbase=python-concurrencytest
pkgname=('python-concurrencytest' 'python2-concurrencytest')
pkgdesc="Python testtools extension for running unittest suites concurrently."
pkgver=0.1.2
pkgrel=2
arch=('any')
url='https://github.com/cgoldberg/concurrencytest'
license=('gpl3')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.python.org/packages/ba/8a/8286de6d3aa9a3c4765cb3dd73515d91129f012a61e0ec8578c733ea2d27/concurrencytest-${pkgver}.tar.gz")

package_python-concurrencytest() {
	depends=('python-testtools' 'python-subunit')

	cd "${srcdir}/concurrencytest-${pkgver}"

	# Install the Python library.
	python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-concurrencytest() {
	depends=('python2-testtools' 'python2-subunit')

	cd "${srcdir}/concurrencytest-${pkgver}"

	# Install the Python 2 library.
	python2 setup.py install --root="${pkgdir}" --optimize=1
}

md5sums=('773d9a8be83fc043a32a25b6665bf59b')
