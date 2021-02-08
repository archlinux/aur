# Maintainer: Stéphane Meyer <tigerlost at tigerfunk dot tk>
# Contributor: Stéphane Meyer <tigerlost at tigerfunk dot tk>

pkgname=btspk
pkgver=1.2.3
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
sha256sums=(65f5368427ec276217d94a34ae47e9941187dfbe877b35645fc033890e8f2819)

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" PREFIX=/usr install
}
