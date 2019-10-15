pkgname=python-pamela
pkgver=1.0.0
pkgrel=1
pkgdesc="Python PAM interface"
arch=('any')
url="https://github.com/minrk/pamela"
license=('MIT')
depends=('pam' 'python')
source=("https://github.com/minrk/pamela/archive/${pkgver}.tar.gz")
md5sums=('0df71e470bc4199548734794a4ddc33a')

package() {
  cd "$srcdir/pamela-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}

