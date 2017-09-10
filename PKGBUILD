# Maintainer: Sean Enck <enckse@gmail.com>

_name=pyxstitch
pkgname=python-$_name
pkgver=1.3.2
pkgrel=1
pkgdesc="takes source code files and produces syntax-highlighted patterns for cross stitching."
arch=("any")
url="https://github.com/enckse/$_name"
license=('MIT')
depends=('python' 'python-webcolors' 'python-pillow' 'python-pygments')
source=("https://github.com/enckse/$_name/archive/v$pkgver.tar.gz")
md5sums=('ac88f541a275603c0621d7b001548764')

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
