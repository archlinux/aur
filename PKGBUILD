# Maintainer: Florian Dejonckheere <florian@floriandejonckheere.be>
pkgname=python-pycompiz-svn
pkgver=3
pkgrel=1
pkgdesc="A high level abstraction utility for controlling Compiz Fusion through D-Bus messaging"
arch=('any')
url="https://code.google.com/p/pycompiz/"
license=('GPL')
depends=('python')
makedepends=('subversion')
source=('pycompiz::svn+http://pycompiz.googlecode.com/svn/trunk/')
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/pycompiz"
	svnversion
}

package() {
	cd "${srcdir}/pycompiz/pyCompiz"
	python2 setup.py install --root "${pkgdir}"
}
