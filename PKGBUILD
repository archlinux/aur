# Maintainer: Violet (violetemailwastaken@gmail.com)
pkgname=cfgprf
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="tool for exporting and importing configs, packages and AUR packages."
arch=(any)
url=""
license=('GPL-3.0-or-later')
groups=()
depends=('rsync' 'tar')
makedepends=()
checkdepends=()
optdepends=('yay: working with AUR packages' 'paru: working with AUR packages')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=($pkgname.sh)
noextract=()
sha256sums=('11825903fd56d040b92d55a682d8e1dd6b71103f4fbcdece02ae7161b7778766')

package() {
	install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
