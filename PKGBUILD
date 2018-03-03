# Maintainer: Ernesto Castellotti <erny.castell@gmail.com>

_pkgname=blivet
pkgname=python-$_pkgname-git
pkgver=bf9b55b
pkgrel=1
pkgdesc='a python module for management of a system storage configuration - python 3.x pkg'
arch=('any')
depends=('multipath-tools' 'mpathconf' 'mdadm' 'libblockdev' 'libselinux' 'python-six' 'python-pyudev' 'hawkey' 'python-pyparted' 'python-pykickstart')
license=('LGPL2.1')
url='http://fedoraproject.org/wiki/Blivet'
source=("git+https://github.com/storaged-project/blivet.git")
sha256sums=('SKIP')

package() {
	cd "${srcdir}/_pkgname"
	python setup.py install --root="${pkgdir}/" --optimize=1
}

 
