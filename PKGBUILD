# Mantainer: Sneakatoo <corinne.9 at hotmail.it>
# Contributor: Martin Patz <mailto at martin-patz.de>
# Contributor: Nicky Heinimann <nicky.heinimann at posteo.de>
# Contributor: Pellegrino Prevete <pellegrinoprevete at gmail.com>

pkgname=indicator-sound-switcher
pkgver=2.3.8
pkgrel=1
pkgdesc="Sound input/output selector indicator for Linux."
arch=('any')
url="https://github.com/yktoo/indicator-sound-switcher"
license=('GPL3')
makedepends=('python-setuptools')
depends=('python' 'python-gobject' 'libkeybinder3' 'libappindicator-gtk3' 'pulseaudio')
options=(!emptydirs)
source=("https://github.com/yktoo/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('844a8ab2b674ebf62ab4933ed8d9a38756592ca912c3935488bb22468ed888f6')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
