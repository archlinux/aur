pkgname=python2-dulwich
pkgver=0.9.7
pkgrel=1
pkgdesc="Dulwich is a pure-Python implementation of the Git file formats and protocols."
arch=('i686' 'x86_64')
url="http://samba.org/~jelmer/dulwich/"
license=('GPL2')
depends=('python2')

source=("https://pypi.python.org/packages/source/d/dulwich/dulwich-$pkgver.tar.gz")
sha1sums=("0823f65c77ac75372560a5336c8e593725b05944")

package() {
  cd "$srcdir/dulwich-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}
