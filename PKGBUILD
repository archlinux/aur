pkgname=python-pamela
pkgver=0.2.1
pkgrel=1
pkgdesc="Python PAM interface"
arch=('any')
url="https://github.com/minrk/pamela"
license=('MIT')
depends=('pam' 'python')
source=("https://github.com/minrk/pamela/archive/${pkgver}.tar.gz")
md5sums=('b8a302b41cfc62912e467fc389d7ceb3')

package() {
  cd "$srcdir/pamela-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" || return 1
}

