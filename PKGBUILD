# Maintainer: Peter Nokes <peter@peternokes.co.uk>

pkgname=python-pure-protobuf
_author=eigenein
_gitname=protobuf
pkgver=2.1.1
pkgrel=1
pkgdesc='Python implementation of Protocol Buffers data types with dataclasses support.'
url='https://github.com/eigenein/protobuf'
arch=('any')
license=('MIT')
depends=('python')
makedepends=(
  git
  python-setuptools
)
provides=('python-pure-protobuf')

source=("$_gitname-$pkgver.tar.gz::https://www.github.com/$_author/$_gitname/archive/$pkgver.tar.gz")
sha256sums=('91854ece115b9fdc36facf73ac96945de32d71cb279fe116f186c1c670e1b61e')

package() {
  cd "$_gitname-$pkgver"
  python setup.py install --root=$pkgdir
} 
