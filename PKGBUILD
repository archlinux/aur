# Maintainer: Mufeed Ali <lastweakness@tuta.io>

pkgname=python-pure-protobuf
_author=eigenein
_gitname=protobuf
pkgver=2.0.1
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
sha256sums=('30fd2ccb075f00e5f24bbeee8434ff3edd8ebf7a02e3a8c665044fe196e4112d')

package() {
  cd "$_gitname-$pkgver"
  python setup.py install --root=$pkgdir
} 
