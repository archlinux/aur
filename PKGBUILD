# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

pkgname=define
pkgver=1.54
pkgrel=1
pkgdesc="Terminal dictionary"
arch=('any')
url="https://github.com/SethDusek/define"
license=('BSD')
depends=('gstreamer' 'python' 'python-requests')
conflicts=('define-git')
source=("https://github.com/SethDusek/define/archive/v$pkgver.tar.gz")
md5sums=('89e72665dbb515e374c3c743b472706e')

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
}
