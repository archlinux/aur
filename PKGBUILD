pkgname=python2-dulwich
pkgver=0.16.3
pkgrel=1
pkgdesc="Dulwich is a pure-Python implementation of the Git file formats and protocols."
arch=('any')
url="http://samba.org/~jelmer/dulwich/"
license=('GPL2')
depends=('python2')

source=("https://www.dulwich.io/releases/dulwich-$pkgver.tar.gz")
sha1sums=('03b0997c557d711ee65c509d4a5d313bbfa2744a')

package() {
  cd "$srcdir/dulwich-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}
