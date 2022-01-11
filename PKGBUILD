# Maintainer: Marcin Kornat <rarvolt@gmail.com>
pkgname=python-hyperchamber
_pkgname=hyperchamber
pkgver=0.3.1
pkgrel=1
pkgdesc="Optimize your hyperparameters"
arch=('any')
url="https://github.com/255BITS/hyperchamber"
license=('MIT')
depends=('python')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/74/19/8ffdc102e8a521532649240896905f786c0d73eb2d25bdcfbf8571cba7c3/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('6698f4826d12c27ed22fe89757087fcf1dfb873823f95b8e4c285eea5b0a42b6')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
