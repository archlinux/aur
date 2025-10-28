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
sha256sums=('6b68eeb8dc6d2051181491ededf6eaee82d9e0d7aa49e12a5f86e37e6df1780e')

package() {
	install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}