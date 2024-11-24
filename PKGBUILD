# Maintainer: Andrew Mackenzie <andrew@mackenzie-serres.net> Sundaram Krishnan <krishnsundaram@gmail.com>


pkgname=pigg-x86_64-unknown-linux-gnu
pkgver=0.5.0
pkgrel=1
epoch=
pkgdesc="A Graphical User Interface for interacting with local and remote Raspberry Pi and Pi Pico Hardware"
arch=(x86_64)
url="https://github.com/andrewdavidmackenzie/pigg.git"
license=('Apache-2.0')
groups=()
depends=(
  alsa-lib
  gcc-libs
  glibc
  openssl
)
makedepends=('rust')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/andrewdavidmackenzie/pigg/releases/download/0.5.0/pigg-x86_64-unknown-linux-gnu.tar.xz")
noextract=()
options=('!lto')
sha256sums=('3854932274abca138b2bf5671abcf5a4c824ecd18e45bee32939ec43f153e521')
validpgpkeys=()

package() {
	cd "$pkgname"
	install -Dm755 "piggui" "$pkgdir/usr/bin/piggui"
	install -Dm755 "piglet" "$pkgdir/usr/bin/piglet"
}
