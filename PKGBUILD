# Maintainer: Violet (violetemailwastaken@gmail.com)
pkgname=cfgprf
pkgver=1.0.2
pkgrel=3
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
sha256sums=('156de49bcbe7bdfacaa1ed474d45c7372efed5b65f89d1dddd7c02f69ee3d62d')

package() {
	install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}