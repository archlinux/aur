# Maintainer: Sean Enck <enckse@gmail.com>

_name=pyxstitch
pkgname=python-$_name
pkgver=1.4.1
pkgrel=1
pkgdesc="takes source code files and produces syntax-highlighted patterns for cross stitching."
arch=("any")
url="https://github.com/enckse/$_name"
license=('MIT')
depends=('python' 'python-pillow' 'python-pygments')
source=("https://github.com/enckse/$_name/archive/v$pkgver.tar.gz")
md5sums=('1422a4c7fb4b59cdf76a5372ef5cf35d')

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
