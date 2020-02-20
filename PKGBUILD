# Maintainer: Nicky Heinimann <nicky.heinimann@posteo.de> 

pkgname=indicator-sound-switcher
pkgver=2.3.0
pkgrel=1
pkgdesc="Sound input/output selector indicator for Ubuntu/Unity"
arch=('any')
url="https://github.com/yktoo/indicator-sound-switcher"
license=('GPL')
groups=()
depends=('python' 'python-gobject' 'libkeybinder3' 'libappindicator-gtk3' 'pulseaudio')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://github.com/yktoo/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('fec36f3c8eb3552ca7819148feda6d3fb12ae521402504b0649c21d56cdde6d1')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
