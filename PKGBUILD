# Maintainer: Jonas Große Sundrup/cherti aur@letopolis.de

pkgname=xattrvi
pkgver=1.1
pkgrel=2
pkgdesc="An editor for a file's extended attributes in the user-namespace"
arch=(any)
url="https://github.com/cherti/xattrvi"
license=('GPL3')
groups=()
depends=('python')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/cherti/xattrvi/archive/v1.1.tar.gz")
noextract=()
sha256sums=("cf14e8d7c26898cf5b0e4d825160a612fb6c5840d2a976a467a02350a53f67ea")
validpgpkeys=()

package() {
	cd "$pkgname-$pkgver"

	install -D xattrvi $pkgdir/usr/bin/xattrvi
	install -D xattrcat $pkgdir/usr/bin/xattrcat

	install -Dm 644 doc/xattrvi.1 $pkgdir/usr/share/man/man1/xattrvi.1
}
