# Maintainer: Martin Patz <mailto at martin-patz.de>
# Contributor: Nicky Heinimann <nicky.heinimann at posteo.de>

pkgname=indicator-sound-switcher
pkgver=2.3.5.2
pkgrel=1
pkgdesc="Sound input/output selector indicator for Linux."
arch=('any')
url="https://github.com/yktoo/indicator-sound-switcher"
license=('GPL3')
groups=()
depends=('python' 'python-gobject' 'libkeybinder3' 'libappindicator-gtk3' 'pulseaudio')
options=(!emptydirs)
source=("https://github.com/yktoo/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('49c836b5d20c505a32971f4fbd2182af')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
