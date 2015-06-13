# Maintainer: Sebastien Leduc <sebastien@sleduc.fr>
# Contributor: Hervé Cauwelier <herve/oursours/net>
pkgname=python2-guppy
_realname=guppy
pkgver=0.1.10
pkgrel=2
pkgdesc="Python memory profiler and debugger"
arch=('any')
url="http://guppy-pe.sourceforge.net"
license=('GPL')
depends=('python2')
source=( "http://pypi.python.org/packages/source/g/guppy/$_realname-$pkgver.tar.gz")
md5sums=('08942f467160a3559f76ea622256d699')

package() {
  cd "$srcdir"/$_realname-$pkgver
  python2 ./setup.py install --root="$pkgdir"
}
