# Maintainer: asukaminato <asukaminato at nyan dot eu dot org>
pkgname=speedtest-rs-bin
pkgver=0.1.4
pkgrel=1
epoch=
pkgdesc="speedtest-cli in Rust."
arch=('x86_64')
url="https://github.com/nelsonjchen/speedtest-rs"
license=('Apache' 'MIT')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=("speedtest-rs")
conflicts=("speedtest-rs")
replaces=()
backup=()
options=()
install=
changelog=
source=("speedtest-rs-${pkgver}.tar.gz::https://github.com/nelsonjchen/speedtest-rs/releases/download/v${pkgver}/speedtest-rs-linux-x86_64.tar.gz")
noextract=()
sha256sums=('589fdbf218b0b0f3bd5a2290b581aef17a5fd94baad19bf818aaee48bc8aa1b0')
validpgpkeys=()

package() {
	install -Dm755 speedtest-rs -t $pkgdir/usr/bin/
	for l in LICENSE-*;
	do
	  install -Dm644 $l -t $pkgdir/usr/share/licenses/$pkgname
	done
}
