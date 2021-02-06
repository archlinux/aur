# Maintainer: Stéphane Meyer <tigerlost at tigerfunk dot tk>
# Contributor: Stéphane Meyer <tigerlost at tigerfunk dot tk>

pkgname=btspk
pkgver=1.2.1
pkgrel=1
pkgdesc="Commandline utility to easily connect bluetooth audio devices."
arch=('any')
url="https://gitlab.com/teegre/btspk"
license=('GPL')
groups=()
depends=('bash' 'bluez-tools' 'bluez-utils' 'coreutils' 'libpulse' 'pulseaudio')
makedepends=()
checkdepends=()
optdepends=('pulseaudio-equalizer' 'pulseaudio-equalizer-ladspa')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$url/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
noextract=()
sha256sums=(77c6fb6d16043c8fdecb5dbf6e04b2901a69644196d596d53440b2476f9290c5)

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" PREFIX=/usr install
}
