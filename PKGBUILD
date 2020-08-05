# Maintainer: Stéphane Meyer <tigerlost at tigerfunk dot tk>
# Contributor: Stéphane Meyer <tigerlost at tigerfunk dot tk>

pkgname=bigtime
pkgver=20200805_1.2.4.4
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
source=("$url/archive/"${pkgver/_/-}".tar.gz")
noextract=()
sha256sums=(f2155a56c528d0f32762d2fa14016bc3d0c51557cb3a0709ae7a698150f3aaf9)

package() {
  cd "$pkgname-${pkgver/_/-}"
  make DESTDIR="$pkgdir/" PREFIX=/usr install
}
