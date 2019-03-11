# Maintainer: Dario Pellegrini <pellegrini.dario at gmail dot com>
pkgname=python-anticaptcha
pkgver=0.3.0
pkgrel=1
pkgdesc="Client library for solve captchas with Anticaptcha.com support."
arch=('any')
url="https://github.com/ad-m/python-anticaptcha"
license=('MIT')
depends=('python')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
source=("https://github.com/ad-m/python-anticaptcha/archive/$pkgver.tar.gz")
md5sums=('a68a7c8e8b5db778ad11c8bc20a07273')

package() {
  cd "$srcdir/python-anticaptcha-$pkgver"
  python setup.py install --root=$pkgdir/ --optimize=1
}

