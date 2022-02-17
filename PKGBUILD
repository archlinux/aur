# Maintainer: Zofia Glapa <zofia.glapa@student.uj.edu.pl>
pkgname=debugger
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="A tool for creating simple, terminal styled program outputs in html."
arch=('any')
url="https://gitlab.com/ia-projekt-zespolowy-2021-2022/debugger"
license=('MIT')
groups=()
depends=('strace')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=("$pkgname-master.zip::https://gitlab.com/ia-projekt-zespolowy-2021-2022/debugger/-/archive/master/debugger-master.zip")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

build() {
	cd "$pkgname-master"
	make
}

package() {
	cd "$pkgname-master"
	make DESTDIR="$pkgdir" PKGNAME="$pkgname" install
}
