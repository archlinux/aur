
pkgname=indicator-sound-switcher
pkgver=2.3.4
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
sha256sums=('87c3b694d481635e6388e037ecf7d20be1f80f7f4babab2279e9be625e0c1f45')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
