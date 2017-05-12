# Maintainer: Marcin Kornat <rarvolt@gmail.com>
pkgname=python-hyperchamber
_pkgname=hyperchamber
pkgver=0.2.8
pkgrel=1
pkgdesc="Optimize your hyperparameters"
arch=('any')
url="https://github.com/255BITS/hyperchamber"
license=('MIT')
depends=('python')
options=(!emptydirs)
source=("https://pypi.io/packages/source/h/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('991988e76a818c2836e9a8306bcaa12e0eca62d5bf26486f1be8b3007d0efa5a')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
