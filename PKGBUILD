# Maintainer: Matt Moore <mattmoore@carbonhelix.com>
pkgname="photon"
pkgver=0.1.2
pkgrel=1
epoch=
pkgdesc="A command-line client utility, written in Haskell, similar to curl that also integrates API-Auth authentication for RESTable API endpoints."
arch=("x86_64")
url="https://github.com/mattmoore/photon"
license=('unknown')
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
md5sums=("6cc63ebb856b04c23cfa06287602e74c")
validpgpkeys=()

package() {
	install -Dm644 $pkgname "$pkgdir/usr/bin/$pkgname"
	chmod +x "$pkgdir/usr/bin/$pkgname"
}
