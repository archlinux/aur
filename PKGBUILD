# Maintainer: Peter Nokes <peter@peternokes.co.uk>

pkgname=python-pure-protobuf
_author=eigenein
_gitname=protobuf
pkgver=2.1.0
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
sha256sums=('1e1641d3987ba7297f73175f05f5778420ed2e1140fffc47994f3e53236d2b82')

package() {
  cd "$_gitname-$pkgver"
  python setup.py install --root=$pkgdir
} 
