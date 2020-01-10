# Maintainer: Mufeed Ali <lastweakness@tuta.io>

pkgname=python-pure-protobuf
_author=eigenein
_gitname=protobuf
pkgver=2.0.0
pkgrel=2
pkgdesc='Python implementation of Protocol Buffers data types with dataclasses support.'
url='https://github.com/VeNoMouS/cloudscraper.git'
arch=('any')
license=('MIT')
depends=('python')
makedepends=('git' 'python-setuptools')
provides=('python-pure-protobuf')

source=("$pkgname-$pkgver.tar.gz::https://www.github.com/$_author/$_gitname/archive/$pkgver.tar.gz")
sha256sums=('e1303e8ae29ce5e33254d49f93d896d04b040070f89e87232e33ecdfbb4ea6d9')

package() {
  cd "$_gitname-$pkgver"
  python setup.py install --root=$pkgdir
} 
