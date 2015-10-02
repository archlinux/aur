# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

pkgname=define
pkgver=1.62
pkgrel=1
pkgdesc="Terminal dictionary"
arch=('any')
url="https://github.com/SethDusek/define"
license=('BSD')
depends=('gstreamer' 'python' 'python-requests')
conflicts=('define-git')
source=("https://github.com/SethDusek/define/archive/$pkgver.tar.gz")
md5sums=('d74269b98babcfc3d369156b46e40460')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
