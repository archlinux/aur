# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

pkgname=define
pkgver=1.71
pkgrel=1
pkgdesc="Terminal dictionary"
arch=('any')
url="https://github.com/SethDusek/define"
license=('BSD')
depends=('gstreamer' 'python' 'python-requests')
conflicts=('define-git')
source=("https://github.com/SethDusek/define/archive/$pkgver.tar.gz")
md5sums=('a3fc39dbd6e693b2c0d6df7d8fdf4c1c')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
