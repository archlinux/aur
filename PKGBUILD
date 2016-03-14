# Maintainer: Roberto Catini <roberto.catini@gmail.com>
pkgname=python-crank
pkgver=0.8.0
pkgrel=1
pkgdesc="Generalized Object based Dispatch mechanism for use across frameworks."
arch=('any')
url="https://github.com/TurboGears/crank"
license=('MIT')
depends=('python')
source=("git://github.com/TurboGears/crank.git#tag=$pkgver")
md5sums=('SKIP')

package() {
  cd "$srcdir/crank"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
