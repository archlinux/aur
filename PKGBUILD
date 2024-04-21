# Maintainer: qsqcqs
pkgname='rig+'
pkgver=1
pkgrel=1
pkgdesc="random identity generator but with some more fun stuff"
arch=('x86_64')
url="https://github.com/qsqcqs/rigp"
license=('GPL-3.0-or-later')
depends=('rig')
checkdepends=()
optdepends=()
source=("https://github.com/qsqcqs/rigp/archive/refs/tags/$pkgver-$pkgrel.tar.gz")
noextract=()
validpgpkeys=()


package() {
	cd "rigp-$pkgver-$pkgrel"
	
    install -Dm644 rig+ "${pkgdir}"/usr/bin/rig+
    chmod +x "${pkgdir}"/usr/bin/rig+
}
sha256sums=('9533f4f9b17a14700835755801a9a78c116234b8056f7ce039532698950564fc')
