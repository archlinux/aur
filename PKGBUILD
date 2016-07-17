# Maintainer: Chromaryu <chrooommaaa@gml.com>
# git repo is from PoroCYon.
pkgname=ibniz-git
pkgver=1.1D00
pkgrel=1
epoch=
pkgdesc="Ideally Bare Numeric Impression giZmo: A VM designed for extremely compact low-level audiovisual programs/demos"
arch=('x86_64' 'i686')
url="https://github.com/PoroCYon/IBNIZ.git"
license=('ZLIB')
groups=()
depends=('sdl')
makedepends=('git' 'perl')
checkdepends=()
optdepends=()
provides=()
conflicts=('ibniz')
replaces=()
backup=()
options=()
install=
changelog=
source=(''$pkgname'::git+https://github.com/PoroCYon/IBNIZ.git')
noextract=()
md5sums=('SKIP')
validpgpkeys=()

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname/bin"
	install -D -m755 ibniz "$pkgdir/usr/bin/ibniz"
    cd "$srcdir/$pkgname"
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
