# Maintainer: Matt Coffin <mcoffin13@gmail.com>
pkgname=psc-package
pkgver=0.3.2
pkgrel=1
epoch=
pkgdesc="A package manager for PureScript based on package sets"
arch=('x86_64')
url="https://github.com/purescript/psc-package"
license=('BSD3')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=('psc-package')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/purescript/psc-package/releases/download/v$pkgver/linux64.tar.gz")
noextract=()
sha1sums=('eee260b2ab17d79f577d339a4a0682a090612d00')
validpgpkeys=()

prepare() {
	cd "$pkgname"
}

build() {
	cd "$pkgname"
}

check() {
	cd "$pkgname"
}

package() {
	cd "$pkgname"
	install -D -m 0755 -t "$pkgdir/usr/bin" psc-package
	if [ -e LICENSE ]; then
		install -D -m 0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
	fi
}
