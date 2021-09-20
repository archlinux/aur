# Maintainer: Kamil Cukrowski <kamilcukrowski@gmail.com
pkgname=negrep-bin
pkgver=1.2.2
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
sha256sums=('7f45a21899eb1a0b75990c3f2b81c24dd0e90637e675bea7cb55df70db58d169')

package() {
	cd "$pkgdir"
	install -d -m755 usr
	install -d -m755 usr/bin
	install -d -m755 usr/share
	cp -a "$srcdir"/negrep/ usr/share/negrep/
	ln -s /usr/share/negrep/negrep usr/bin/negrep
}


