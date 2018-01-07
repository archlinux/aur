# Maintainer: Matt Moore <mattmoore@carbonhelix.com>
pkgname="photon"
pkgver=0.1.9
pkgrel=1
epoch=
pkgdesc="A command-line client utility, written in Haskell, similar to curl that also integrates API-Auth authentication for RESTable API endpoints."
arch=("x86_64")
url="https://github.com/mattmoore/photon"
license=('MIT')
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
_file="${pkgname}_${pkgver}-${pkgrel}_linux_${arch}"
source=("https://github.com/mattmoore/photon/releases/download/${pkgver}/${_file}.tar.xz")
noextract=()
sha256sums=("46bb71c5850b599a8edd83b8a79633b0619daedbc79ad7e71108030d88fa0ac8")
validpgpkeys=()

package() {
	install -Dm644 $pkgname "$pkgdir/usr/bin/$pkgname"
	chmod +x "$pkgdir/usr/bin/$pkgname"
}
