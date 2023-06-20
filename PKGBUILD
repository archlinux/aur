pkgname=python-pamela
pkgver=1.1.0
pkgrel=1
pkgdesc="Python PAM interface"
arch=('any')
url="https://github.com/minrk/pamela"
license=('MIT')
depends=('pam' 'python')
makedepends=('python-setuptools')
source=("https://github.com/minrk/pamela/archive/${pkgver}.tar.gz")
md5sums=('8204bfa354129dcd9301de0f75d5e219')

package() {
  cd "$srcdir/pamela-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}

