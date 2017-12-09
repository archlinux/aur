# Maintainer: Sean Enck <enckse@gmail.com>

_name=pyxstitch
pkgname=python-$_name
pkgver=1.6.0
pkgrel=1
pkgdesc="takes source code files and produces syntax-highlighted patterns for cross stitching."
arch=("any")
url="https://github.com/enckse/$_name"
license=('MIT')
depends=('python' 'python-pillow' 'python-pygments')
source=("https://github.com/enckse/$_name/archive/v$pkgver.tar.gz")
md5sums=('74e1e9bc080c61001f10de5884b85334')

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
