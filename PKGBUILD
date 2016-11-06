# Maintainer: Michal Salaban <michal@salaban.info>
pkgname=python2-djiki
pkgver=0.7
pkgrel=1
pkgdesc="A lightweight, portable Wiki engine based on Django"
arch=('any')
url="https://djiki.info"
license=('BSD')
depends=('python2' 'python2-django' 'python2-creole')
optdepends=('sorl-thumbnail: Handling of images')
source=("https://pypi.python.org/packages/07/5e/17a13502bdf4556caf98ab95859f21d46df675943f5bb7caa01317ac749d/djiki-$pkgver.tar.gz")
md5sums=('474e1e02aa0a8e3df5d1048e8d4376f5')

package() {
	cd djiki-$pkgver
	python2 setup.py install --root="$pkgdir/" --optimize=1
	chmod -R a+rX $pkgdir
}
