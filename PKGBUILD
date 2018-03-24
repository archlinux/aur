# Maintainer: Mark E.A. <evalapply ``dot'' aur ``at'' airmail ``dot'' cc>

pkgname=python-marisa-trie
_pyname=marisa-trie
pkgver=0.7.2
pkgrel=1
pkgdesc='Static memory-efficient & fast Trie-like structures for Python (based on marisa-trie C++ library)'
arch=('i686' 'x86_64')
url='https://github.com/kmike/marisa-trie'
license=('MIT')
depends=('python')
makedepends=()
optdepends=()
source=("https://github.com/kmike/${_pyname}/archive/${pkgver}.tar.gz")
sha256sums=('5a5ca6a032fe924097f87439130f013dfb2682e597f4d5414bb87cfe49bc715e')

build() {
	cd "$_pyname-$pkgver"
	python setup.py build
}

package() {
	cd "$_pyname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
