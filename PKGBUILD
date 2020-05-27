
pkgname=indicator-sound-switcher
pkgver=2.3.3
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
sha256sums=('0b73d88954f4d6f91b0a6ff3ada9fc788897db20a0129bc7524c8ac4f4c717d5')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
