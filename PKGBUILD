# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: M1dn1ghtStar m1dn1ghtstar@####################

pkgname=saveshasum
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="A simple program to generate the shasum of a file and save it to another file."
arch=(any)
url="https://codeberg.org/M1dn1ghtStar/saveshasum/"
license=('AGPL-3.0-or-later')
groups=()
depends=('coreutils')
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
source=("https://codeberg.org/M1dn1ghtStar/saveshasum/raw/branch/main/saveshasum-1.0.0.tar.gz")
noextract=()
validpgpkeys=()

package() {
	cd "$pkgname-$pkgver"
	cp -r --preserve=mode,timestamps usr/ "${pkgdir}/"
}

build() {
	cd "$pkgname-$pkgver"
}

sha256sums=('13e4d2ac72adcec1b6b8958bdffa0e22593d04414e418882f70e4f7850600e02')
