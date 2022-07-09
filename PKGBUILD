# Mantainer: Sneakatoo <corinne.9 at hotmail.it>
# Co-maintainer: Pellegrino Prevete <pellegrinoprevete at gmail.com>
# Contributor: Martin Patz <mailto at martin-patz.de>
# Contributor: Nicky Heinimann <nicky.heinimann at posteo.de>
# Contributor: milkii

pkgname=indicator-sound-switcher
pkgver=2.3.9
pkgrel=1
pkgdesc="Sound input/output selector indicator for Linux."
arch=('any')
url="https://github.com/yktoo/indicator-sound-switcher"
license=('GPL3')
makedepends=('python-setuptools')
depends=('python' 'python-gobject' 'libkeybinder3' 'libappindicator-gtk3' 'pulseaudio')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/yktoo/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('d76e535ee13727c2651939cf5ea92eb0d8e1dec444785f9d0e0f6b56886b6e57')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
