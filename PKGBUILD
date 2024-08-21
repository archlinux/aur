pkgname=python-pamela
pkgver=1.2.0
pkgrel=1
pkgdesc="Python PAM interface"
arch=('any')
url="https://github.com/minrk/pamela"
license=('MIT')
depends=('pam' 'python')
makedepends=('python-setuptools')
source=("https://github.com/minrk/pamela/archive/${pkgver}.tar.gz")
md5sums=('ae3a8036f28f1a1cb1d823e11aca5927')

package() {
  cd "$srcdir/pamela-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}

