# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Anthony25 <Anthony Ruhier>

pkgbase=python-selectors2
pkgname=('python2-selectors2' 'python-selectors2')
pkgver=2.0.1
pkgrel=6
arch=('any')
url='https://github.com/SethMichaelLarson/selectors2'
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=($pkgbase-$pkver.tar.gz::https://github.com/SethMichaelLarson/selectors2/archive/$pkgver.tar.gz)
sha256sums=('482ee6168dad08fc46db82d99bc28be4b4256512809d39191d232c412d6293b4')

package_python-selectors2() {
  pkgdesc='Backported, durable, and portable selectors.'
  cd "${srcdir}"/selectors2-$pkgver

  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-selectors2() {
  pkgdesc='Backported, durable, and portable selectors.'
  cd "${srcdir}"/selectors2-$pkgver

  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
