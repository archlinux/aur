# Maintainer: Matthew "Madness" Evan <mattmadness@420blaze.it>
pkgname=python-purple-git
pkgver=2021.02.14
pkgrel=0
pkgdesc="Python bind for libpurple using the Cython extension"
arch=(any)
license=('GPL3')
url='https://github.com/fahhem/python-purple'
depends=('libpurple' 'cython2' 'python2')
makedepends=('gcc' 'git')
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
	python2 setup.py install --root="$pkgdir/"
}	
