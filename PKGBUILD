pkgname=python-pamela
pkgver=0.3.0
pkgrel=1
pkgdesc="Python PAM interface"
arch=('any')
url="https://github.com/minrk/pamela"
license=('MIT')
depends=('pam' 'python')
source=("https://github.com/minrk/pamela/archive/${pkgver}.tar.gz")
md5sums=('d4eca701a798c8411e7c7c4a3f4dbc92')

package() {
  cd "$srcdir/pamela-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}

