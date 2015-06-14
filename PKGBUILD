# Contributor: Andy Roberts (arooaroo) <dev@andy-roberts.net>

pkgname=pyreb
pkgver=0.1.6
pkgrel=1
pkgdesc="Python Regular Expression Builder is a wxPython GUI to the re python module"
arch=('any')
url="http://pyreb.nongnu.org/"
license="GPL"
depends=('wxpython' 'python2-setuptools')
source=(http://download.savannah.nongnu.org/releases/pyreb/Pyreb-$pkgver.tar.gz)
md5sums=('4ac72cb016429e91f20edc9e4e1fe30f')

package() {
  cd "$srcdir/Pyreb-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir"
}
