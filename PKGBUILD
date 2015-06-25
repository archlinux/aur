# Maintainer: Troy C < rstrox -ta yahoo -tod com >

pkgname=python2-rax-backup-schedule-python-novaclient-ext
pkgver=0.1.2
pkgrel=5
pkgdesc="Novaclient Extension for Backup Schedule"
arch=('any')
url="http://pypi.python.org/pypi/rax_backup_schedule_python_novaclient_ext"
license=('GPL')
depends=('python2' 'python2-novaclient' 'python2-httplib2' 'python2-prettytable' 'python2-simplejson' 'python2-iso8601')
makedepends=('python2-setuptools')
provides=("$pkgname=$pkgver")
source=("https://pypi.python.org/packages/source/r/rax_backup_schedule_python_novaclient_ext/rax_backup_schedule_python_novaclient_ext-${pkgver}.tar.gz")
md5sums=('5a4f9da670e5171623ee25b48d5b30a1')

build() {
	cd "$srcdir/rax_backup_schedule_python_novaclient_ext-$pkgver"
	python2 setup.py build
}

package() {
	cd "$srcdir/rax_backup_schedule_python_novaclient_ext-$pkgver"
	python2 setup.py install --root=${pkgdir}
}
