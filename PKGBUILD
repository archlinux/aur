# Maintainer: Kamil Cukrowski <kamilcukrowski@gmail.com
pkgname=negrep-bin
pkgver=1.4.1
pkgrel=1
pkgdesc="Grep-like utility based on Nevod Textual Pattern Matching"
arch=('x86_64')
url="https://github.com/nezaboodka/nevod"
license=('Apache')
groups=()
depends=('curl')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
	"https://github.com/nezaboodka/nevod/releases/download/v${pkgver}/negrep-rhel.6-x64.tar.gz"
)
noextract=()
sha256sums=('f52658f3f84b380236a45c4cd46f66895ba2e36389211bd1370805bc90f18ebb')

package() {
	cd "$pkgdir"
	install -vd -m755 usr
	install -vd -m755 usr/bin
	install -vd -m755 usr/lib
	cp -va "$srcdir"/negrep/ usr/lib/negrep/
	ln -vs /usr/lib/negrep/negrep usr/bin/negrep
}


