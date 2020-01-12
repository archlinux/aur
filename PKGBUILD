# Maintainer: Radim Sückr <contact@radimsuckr.cz>

pkgname=python-hosts
pkgver=0.4.7
pkgrel=1
pkgdesc='A hosts file manager library written in python'
arch=('any')
url='https://github.com/jonhadfield/python-hosts'
license=('MIT')
source=('git+https://github.com/jonhadfield/python-hosts.git')
sha512sums=('SKIP')

prepare() {
	cd ${pkgname}
	python setup.py build
}

package() {
	cd ${pkgname}
	python setup.py install --root=${pkgdir} --optimize=1 --skip-build
}
