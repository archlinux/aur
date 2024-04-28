# Maintainer: qsqcqs
pkgname='rig+'
pkgver=1
pkgrel=2
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

sha256sums=('7dab906f0b03df6859d801c41e48daf594b3dd0de33e377c9506c56fb21d0f95')
