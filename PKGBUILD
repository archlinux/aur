# Maintainer: Stéphane Meyer <tigerlost at tigerfunk dot tk>
# Contributor: Stéphane Meyer <tigerlost at tigerfunk dot tk>

pkgname=btspk
pkgver=1.2.5
pkgrel=1
pkgdesc="Commandline utility to easily connect bluetooth audio devices."
arch=('any')
url="https://gitlab.com/teegre/btspk"
license=('GPL')
groups=()
depends=('bash' 'bluez-tools' 'bluez-utils' 'coreutils' 'libpulse' 'pulseaudio')
makedepends=()
checkdepends=()
optdepends=('pulseaudio-equalizer' 'pulseaudio-equalizer-ladspa' 'pipewire' 'pipewire-pulse')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$url/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
noextract=()
sha256sums=(e5d1aebf5ac3faf5cda6f5552a14271b0864b9ff4bb6654744bffb2bc166397a)

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" PREFIX=/usr install
}
