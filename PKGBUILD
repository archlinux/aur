# Maintainer: portaloffreedom

_pkgsrcname=python-vlc
pkgname=python-vlc
pkgver=3.0.102
pkgrel=1
pkgdesc="VLC bindings for python"
url="http://wiki.videolan.org/PythonBinding"
license=("GPL2")
arch=("any")
depends=('python' 'vlc')
source=("https://pypi.python.org/packages/a4/54/0d2797e4b1c4891004ffaae22510419ec25b2b318385dde31f45060a7e79/$_pkgsrcname-$pkgver.tar.gz")
md5sums=('7223e009debc7cca65471223a7678437')

package() {
  cd $srcdir/${_pkgsrcname}-$pkgver
  python3 setup.py install --root $pkgdir
}


