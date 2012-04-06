# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=python2-oger
pkgver=1.1.2
pkgrel=1
pkgdesc="OrGanic Environment for Reservoir computing (Oger) is a Python toolbox for building, training and evaluating modular learning architectures"
arch=('any')
url="http://organic.elis.ugent.be/organic/engine"
license=('GPL')
depends=('python2-numpy' 'python2-scipy' 'python2-matplotlib' 'python2-mdp')
makedepends=('cmake')
source=(http://organic.elis.ugent.be/sites/organic.elis.ugent.be/files/Oger-${pkgver}.tar.gz)
md5sums=('fe02dc000c8ce2a3049f7ec36f70d4cb')

build() {
	cd ${srcdir}/Oger-${pkgver}
	
	python2 setup.py install --root=${pkgdir}
}

