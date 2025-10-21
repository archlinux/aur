# Maintainer: Violet (violetemailwastaken@gmail.com)
pkgname=cfgprf
pkgver=1.0.1
pkgrel=2
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
sha256sums=('f1e29b16105541371a375a47a6a743f3b2691a296558f4174d031cd6701aa316')

package() {
	install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}