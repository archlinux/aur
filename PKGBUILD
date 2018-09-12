# Maintainer: Frank Asseg <frank.asseg@objecthunter.net>
_commit=5182577b6c154a8564fc25c4a8f8f7d5760b3b6a
pkgname=crumbs
pkgver=0.0.1
pkgrel=1
epoch=
pkgdesc="A bookmarking system for the command line"
arch=('any')
url="https://github.com/fasseg/crumbs"
license=('WTFPL')
groups=()
depends=()
makedepends=('git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=('etc/crumbs.conf')
options=()
install=
changelog=
source=("git://github.com/fasseg/crumbs.git#commit=${_commit}")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

build() {
	cd "$pkgname"
	./configure --prefix=/usr --sysconfdir=/etc
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}
