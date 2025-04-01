# Maintainer: Theo Grivel <theo.grivel@epfl.ch>
pkgname=manta
pkgver="v1.54.1"
pkgsubver="-beta.100"
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
sha256sums=('acdc6470294dcee5e651294f6ff75219e40916c8de14ffbdfcef11ce2d230266')
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
