# Maintainer: Dario Pellegrini <pellegrini.dario at gmail dot com>
pkgname=python-anticaptcha
pkgver=0.6.0
pkgrel=1
pkgdesc="Client library for solving captchas with anticaptcha.com support."
arch=('any')
url="https://github.com/ad-m/python-anticaptcha"
license=('MIT')
depends=('python' 'python-wheel')
makedepends=('python-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/d2/62/e7f745bd75e8614822d91312fa89bdf43fbcf17ea422c7712f49cb357ebe/python-anticaptcha-0.6.0.tar.gz")
md5sums=('604305bea94354aa6e32086e404eea75')

package() {
  cd "$srcdir/python-anticaptcha-$pkgver"
  python setup.py install --root=$pkgdir/ --optimize=1
}

