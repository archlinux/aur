# Maintainer: Matthew "Madness" Evan <mattmadness@420blaze.it>
pkgname=python-purple-git
pkgver=2020.02.12
pkgrel=4
pkgdesc="Python bind for libpurple using the Cython extension"
arch=(any)
license=('GPL3')
url='https://github.com/monofox/python-purple'
provides=('python-purple')
conflicts=('python-purple')
source=("git+https://github.com/monofox/python-purple.git")
md5sums=("SKIP")

build() {
	cd "$srcdir/python-purple"
	python2 setup.py build
}

package() {
	cd python-purple	
	python2 setup.py install --root="$pkgdir/python-purple-git"
}	
