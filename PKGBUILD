# Maintainer: Violet (violetemailwastaken@gmail.com)
pkgname=cfgprf
pkgver=1.0.3
pkgrel=5
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
sha256sums=('7be9601d459a7273ff5a810c4a33f190717a008721595ecb59c89523effb584c')

package() {
	install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}