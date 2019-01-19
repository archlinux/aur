# Maintainer: Marc Heinimann <marc.heinimann@posteo.de> 

pkgname=indicator-sound-switcher
pkgver=2.2.0
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
sha256sums=('38baebd3393ac68bd0840901134ec972e92620d4cee37dba51bd7816dd9173eb')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
