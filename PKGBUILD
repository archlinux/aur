# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
pkgname=hotdoc
pkgver=0.8.1
pkgrel=1
pkgdesc="The tastiest API documentation system."
arch=('i686' 'x86_64')
url="https://github.com/hotdoc/hotdoc"
license=('LGPLv2')
depends=('python2' 'python2-sqlalchemy' 'python2-schema' 'python2-toposort' 'python2-wheezy' 'python2-pygraphviz')
source=("git+https://github.com/hotdoc/hotdoc.git#tag=$pkgver")
md5sums=('SKIP')

build() {
  cd hotdoc
  python2 setup.py build
}
 
package() {
  cd hotdoc
  python2 setup.py install --root="$pkgdir" --optimize=1
}
