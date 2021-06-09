# Maintainer: Kamil Cukrowski <kamilcukrowski@gmail.com
pkgname=negrep-bin
pkgver=1.1.7
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
sha256sums=('874d8db89e094f68625fc92910ced086c66f99aad1b3bcd22d486409cb495aab')

package() {
	cd "$pkgdir"
	install -d -m755 usr
	install -d -m755 usr/bin
	install -d -m755 usr/share
	cp -a "$srcdir"/negrep/ usr/share/negrep/
	ln -s /usr/share/negrep/negrep usr/bin/negrep
}


