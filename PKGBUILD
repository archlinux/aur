# Maintainer: Rohit Goswami (HaoZeke) <rohit.goswami@aol.com>
pkgname=tmetric-rpm
pkgver="20.2.4"
pkgrel=1
epoch=
pkgdesc="TMetric is a simple and accurate work time-tracker that sets you free from tedious time reporting. Built from the rpm to prevent breakage."
arch=('x86_64')
url="https://tmetric.com"
license=('GPL2')
groups=()
depends=()
provides=('tmetric')
conflicts=('tmetric''tmetric-desktop')
options=('!strip' '!emptydirs')
makedepends=()
checkdepends=()
optdepends=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.$arch.rpm::https://static.tmetric.com/desktop/download/linux/rpm/$CARCH")
md5sums=('4736678e8d592394e0f66e33120709a2')
noextract=()                             

package() {
  # cd "$srcdir/"
  cp -rf usr ${pkgdir}
  # make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
