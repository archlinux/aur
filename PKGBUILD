# Maintainer: Violet (violetemailwastaken@gmail.com)
pkgname=cfgprf
pkgver=1.0.4
pkgrel=6
epoch=
pkgdesc="tool for exporting and importing dotfiles, packages and AUR packages."
arch=(any)
url="https://git.gay/violet/cfgprf"
license=('GPL-3.0-or-later')
groups=()
depends=('rsync' 'tar' 'util-linux')
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
sha256sums=('85e7ed4f1ab84fa02ba09ed5b4ba9c69a77641ef54cfc037acf0dbe50d437ca2')

package() {
	install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}