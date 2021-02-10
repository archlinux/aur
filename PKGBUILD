# Maintainer: Matthew "Madness" Evan <mattmadness@420blaze.it>
pkgname=python-purple-git
pkgver=2011.02.23
pkgrel=0
pkgdesc="Python bind for libpurple using the Cython extension"
arch=(any)
license=('GPL3')
url='https://github.com/fahhem/python-purple'
#depends=('libpurple' 'python2' 'cython2' 'git')
provides=('python-purple')
conflicts=('python-purple')
source=("git+https://github.com/fahhem/python-purple.git")
md5sums=("SKIP")

build() {
	cd "$srcdir/python-purple"
	python2 setup.py build
}

package() {
	cd python-purple	
	python2 setup.py install --root="$pkgdir/python-purple-git"
}	
