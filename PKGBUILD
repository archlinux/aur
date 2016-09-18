# Maintainer: Jonas Große Sundrup/cherti aur@letopolis.de

pkgname=xattrvi
pkgver=1.0
pkgrel=1
#epoch=0
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
sha256sums=("f5022d5ebb268d107e4c49d3d790a9df56645ffc9f7ded3ad44f622548424e59")
validpgpkeys=()

package() {
	cd "$pkgname-$pkgver"
	mkdir -p $pkgdir/usr/bin
	cp xattrvi $pkgdir/usr/bin/xattrvi
}
