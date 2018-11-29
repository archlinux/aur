# Maintainer: Jonas Große Sundrup/cherti aur@letopolis.de

pkgname=xattrvi
pkgver=1.0
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
source=("https://github.com/cherti/xattrvi/archive/v1.0.tar.gz")
noextract=()
sha256sums=("7c1ae937a2f43c9fb2f2c01f05e3b8871604d5f904ed7fdd7ffd467a5c11a06b")
validpgpkeys=()

package() {
	cd "$pkgname-$pkgver"

	mkdir -p $pkgdir/usr/bin
	cp xattrvi $pkgdir/usr/bin/xattrvi

	mkdir -p $pkgdir/usr/share/man/man1
	cp doc/xattrvi.1 $pkgdir/usr/share/man/man1/xattrvi.1
}
