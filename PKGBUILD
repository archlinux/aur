# Maintainer: Andrew Mackenzie <andrew@mackenzie-serres.net> Sundaram Krishnan <krishnsundaram@gmail.com>


pkgname=pigg-x86_64-unknown-linux-gnu
pkgver=0.7.0
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
source=("https://github.com/andrewdavidmackenzie/pigg/releases/download/0.7.0/piggui-x86_64-unknown-linux-gnu.tar.xz")
noextract=()
options=('!lto')
sha256sums=('b18e88f9e06434d00aec32954b0cb7fbb4b1aa5e0e7bd6d97aab2203879606d4')
validpgpkeys=()

package() {
	cd "piggui-x86_64-unknown-linux-gnu"
	install -Dm755 "piggui" "$pkgdir/usr/bin/piggui"
}
