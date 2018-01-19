# Maintainer: Matt Moore <mattmoore@carbonhelix.com>
pkgname="photon"
pkgver=0.1.10
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
sha256sums=("8c0a1fb6f4182698dc6bd836d98e20225e2c00128f81829e8b4e01b2957f6368")
validpgpkeys=()

package() {
	install -Dm644 $pkgname "$pkgdir/usr/bin/$pkgname"
	chmod +x "$pkgdir/usr/bin/$pkgname"
}
