# Maintainer: Stéphane Meyer <tigerlost at tigerfunk dot tk>
# Contributor: Stéphane Meyer <tigerlost at tigerfunk dot tk>

pkgname=btspk
pkgver=1.2.4
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
sha256sums=(3ff9c5d4258482c3936f8e94a3d942fed0b706bd89cea268cf86462d9619071a)

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" PREFIX=/usr install
}
