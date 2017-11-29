# Maintainer: Matt Coffin <mcoffin13@gmail.com>
pkgname=jbe-bin
pkgver=0.1.1
pkgrel=1
epoch=
pkgdesc="Java bytecode editing tool"
arch=('any')
url="http://set.ee/jbe"
license=('unknown')
groups=()
depends=('java-environment')
makedepends=()
checkdepends=()
optdepends=()
provides=('jbe')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://set.ee/jbe/jbe-$pkgver.zip" 'jbe.sh')
noextract=()
sha256sums=('f3a8a79b4f6df6dbe0dfeaff04b9c3b47e240df97eb70f2cc8ff63f9917284bc' '7bcfc91e980fa88da7594476e28c0ab7ac2a7dffc5ad18ff60e77369963c1010')
validpgpkeys=()

prepare() {
	cd $srcdir/jbe
	rm jbe.bat jbe.sh
}

build() {
	cd $srcdir
}

check() {
	cd $srcdir
}

package() {
	mkdir -p $pkgdir/usr/share/java/jbe
	cp -r jbe/* $pkgdir/usr/share/java/jbe
	install -D -m755 jbe.sh $pkgdir/usr/bin/jbe
}
