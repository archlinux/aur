# Maintainer: Frank Asseg <frank.asseg@objecthunter.net>
_commit=ae9920214698e00179008a2d92d179c3107c51bd
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
