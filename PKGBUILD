pkgname=python2-dulwich
pkgver=0.17.1
pkgrel=1
pkgdesc="Dulwich is a pure-Python implementation of the Git file formats and protocols."
arch=('any')
url="http://samba.org/~jelmer/dulwich/"
license=('GPL2')
depends=('python2')

source=("https://www.dulwich.io/releases/dulwich-$pkgver.tar.gz")
sha1sums=('3cd487ac54df10be35e5882cb15e54982773b266')

package() {
  cd "$srcdir/dulwich-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}
