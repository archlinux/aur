# Maintainer: Matti Pulkkinen (Crashlog) <matti.pulkkinen3 [at] gmail [dot] com>

pkgname=flake8-pep257
pkgver=1.0.3
pkgrel=1
pkgdesc="Flake8 plugin for the pep257 Python utility for validating docstrings."
arch=('any')
url="https://github.com/Robpol86/flake8-pep257"
license=('MIT')
depends=('pep257' 'flake8')
options=(!emptydirs)
source=("https://github.com/Robpol86/flake8-pep257/archive/v${pkgver}.tar.gz")
sha256sums=('205d3d00ba8e6446d9d779886de8ed8cbcebc7c893585b413cdac12a8784322f')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
    
# vim:set ts=2 sw=2 et:
