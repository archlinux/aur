# Maintainer: Stéphane Meyer <tigerlost at tigerfunk dot tk>
# Contributor: Stéphane Meyer <tigerlost at tigerfunk dot tk>

pkgname=bigtime
pkgver=2.1
pkgrel=1
pkgdesc="Customizable clock for the terminal"
arch=('any')
url="https://github.com/teegre/bigtime"
license=('MIT')
groups=()
depends=('alsa-utils' 'bash' 'coreutils' 'libnotify' 'ncurses')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$url/archive/"${pkgver}".tar.gz")
noextract=()
sha256sums=(86dd2ffe17b0787d2c4aeb2a10d45c0bc0a612d4922afa7bf3b2cfd030fddbf9)

package() {
  cd "$pkgname-${pkgver/_/-}"
  make DESTDIR="$pkgdir/" PREFIX=/usr install
}
