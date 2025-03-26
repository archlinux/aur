# Maintainer: Theo Grivel <theo.grivel@epfl.ch>
pkgname=manta
pkgver="v1.54.1"
pkgsubver="-beta.98"
pkgrel=1
epoch=
pkgdesc="Manta is a frontend CLI to interact with OpenCHAMI."
arch=('x86_64')
url="https://github.com/eth-cscs/manta"
license=('ETH-Zurich')
groups=()
depends=()
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
source=("https://github.com/eth-cscs/$pkgname/releases/download/$pkgver$pkgsubver/$pkgname-x86_64-unknown-linux-gnu.tar.xz")
noextract=()
sha256sums=('5ddecd103c5f9d8dde8a775a07d6174396aaade771d305c13d1761770acb7083')
validpgpkeys=()

prepare() {
	mkdir -p "$pkgname-$pkgver$pkgsubver"
	tar -xvf "$pkgname-x86_64-unknown-linux-gnu.tar.xz" --strip 1 -C "$pkgname-$pkgver$pkgsubver"
}

build() {
	cd "$pkgname-$pkgver$pkgsubver"
}

check() {
	cd "$pkgname-$pkgver$pkgsubver"
}

package() {
	cd "$pkgname-$pkgver$pkgsubver"
	install -d "$pkgdir/usr/bin"
	cp -a  ${srcdir}/"$pkgname-$pkgver$pkgsubver"/manta ${pkgdir}/usr/bin/$pkgname
}
