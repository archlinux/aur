# Maintainer: Frank Asseg <frank.asseg@objecthunter.net>
_commit=dddfba8a278c903806fc83da50efb72e8f6d60b8
pkgname=crumbs
pkgver=0.0.2
pkgrel=2
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
