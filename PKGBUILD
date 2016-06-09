pkgname=python2-dulwich
pkgver=0.13.0
pkgrel=1
pkgdesc="Dulwich is a pure-Python implementation of the Git file formats and protocols."
arch=('i686' 'x86_64')
url="http://samba.org/~jelmer/dulwich/"
license=('GPL2')
depends=('python2')

source=("https://www.dulwich.io/releases/dulwich-$pkgver.tar.gz")
sha1sums=('a1211d8e42904a3477098458d5cd870c46313abc')

package() {
  cd "$srcdir/dulwich-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}
