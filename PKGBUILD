# Maintainer: Stéphane Meyer <tigerlost at tigerfunk dot tk>
# Contributor: Stéphane Meyer <tigerlost at tigerfunk dot tk>

pkgname=btspk
pkgver=1.2.9
pkgrel=1
pkgdesc="Commandline utility to easily connect bluetooth audio devices."
arch=('any')
url="https://github.com/teegre/btspk"
license=('GPL')
groups=()
depends=('bash' 'bluez-tools' 'bluez-utils' 'coreutils')
makedepends=()
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${url}/archive/refs/tags/1.2.9.tar.gz")
noextract=()
sha256sums=(811a2be0ab15f0c22205241c7ae226dba279e845547ceaae71479278743dda9a)

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" PREFIX=/usr install
}
