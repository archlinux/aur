# Maintainer: Sean Enck <enckse@gmail.com>

_name=pyxstitch
pkgname=python-$_name
pkgver=1.4.0
pkgrel=1
pkgdesc="takes source code files and produces syntax-highlighted patterns for cross stitching."
arch=("any")
url="https://github.com/enckse/$_name"
license=('MIT')
depends=('python' 'python-pillow' 'python-pygments')
source=("https://github.com/enckse/$_name/archive/v$pkgver.tar.gz")
md5sums=('1d48b10c8f4650481485108203865306')

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
