# Maintainer: Dario Pellegrini <pellegrini.dario at gmail dot com>
pkgname=python-anticaptcha
pkgver=0.4.1
pkgrel=1
pkgdesc="Client library for solving captchas with anticaptcha.com support."
arch=('any')
url="https://github.com/ad-m/python-anticaptcha"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
source=("https://github.com/ad-m/python-anticaptcha/archive/$pkgver.tar.gz")
md5sums=('0b8b88b20de4b687204f3b2eb8a7d5d6')

package() {
  cd "$srcdir/python-anticaptcha-$pkgver"
  python setup.py install --root=$pkgdir/ --optimize=1
}

