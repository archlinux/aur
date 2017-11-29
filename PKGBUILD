# Maintainer: Doron Behar <doron.behar@gmail.com>

pkgname=indicator-sound-switcher
pkgver=2.1.1
pkgrel=1
pkgdesc="Sound input/output selector indicator for Ubuntu/Unity"
arch=('any')
url="https://github.com/yktoo/indicator-sound-switcher"
license=('GPL')
groups=()
depends=('python' 'python-gobject' 'libappindicator-gtk3' 'pulseaudio')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://github.com/yktoo/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=("3533349b468588d128341de9106e6114")

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
