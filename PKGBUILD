# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname=python2-anyvc
pkgver=0.3.7.1
pkgrel=1
pkgdesc="Python abstraction library for version control systems"
arch=('any')
depends=('python2-py')
optdepends=('bzr' 'darcs' 'git' 'mercurial' 'monotone' 'subversion')
conflicts=('anyvc')
replaces=('anyvc')
provides=('anyvc')
license=('LGPL')
url="https://github.com/RonnyPfannschmidt-Attic/anyvc"
source=(http://pypi.python.org/packages/source/a/anyvc/anyvc-${pkgver}.tar.gz)
 
package() {
	cd "$srcdir"/anyvc-$pkgver
	python2 setup.py install --root="$pkgdir" --prefix=/usr
}

md5sums=('a1031fa70077cf1c8a8bcb4839424ba6')
