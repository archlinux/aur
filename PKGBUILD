# Maintainer: Stéphane Meyer <tigerlost at tigerfunk dot tk>
# Contributor: Stéphane Meyer <tigerlost at tigerfunk dot tk>

pkgname=bigtime
pkgver=20200730_1.2.2
pkgrel=1
pkgdesc="Customizable clock for the terminal"
arch=('any')
url="https://github.com/teegre/bigtime"
license=('MIT')
groups=()
depends=('alsa-utils' 'bash' 'coreutils' 'ncurses')
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
source=("$url/archive/"${pkgver/_/-}".tar.gz")
noextract=()
sha256sums=(3ec1d6a87de26e76a870ca2d3f61ece84923d5229d56b9f52d28f67dcb3b4a9f)

package() {
  cd "$pkgname-${pkgver/_/-}"
  make DESTDIR="$pkgdir/" PREFIX=/usr install
}
