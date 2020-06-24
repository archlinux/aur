# Maintainer: Dario Pellegrini <pellegrini.dario at gmail dot com>
pkgname=python-anticaptcha
pkgver=0.7.0
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
source=("https://files.pythonhosted.org/packages/28/f1/8e08b3e7cc0b67f774c62a5011efe3bd8cb234e4ef1364b1e12868613d7c/python-anticaptcha-0.7.0.tar.gz")
md5sums=('11c216f6fbf2236834536901092b364a')

package() {
  cd "$srcdir/python-anticaptcha-$pkgver"
  python setup.py install --root=$pkgdir/ --optimize=1
}

