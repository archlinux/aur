# Maintainer: Sean Enck <enckse@gmail.com>

_name=pyxstitch
pkgname=python-$_name
pkgver=1.3.0
pkgrel=1
pkgdesc="takes source code files and produces syntax-highlighted patterns for cross stitching."
arch=("any")
url="https://github.com/enckse/$_name"
license=('MIT')
depends=('python' 'python-webcolors' 'python-pillow' 'python-pygments')
source=("https://github.com/enckse/$_name/archive/v$pkgver.tar.gz")
md5sums=('a23d5a878078ed9e62235d632b137e0a')

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
