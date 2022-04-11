# Maintainer: Juliette Cordor
pkgname="cmd-not-found"
pkgver="1.0.0"
pkgrel="4"
pkgdesc="A simple hook to display required packages when a command is not found"
url=""
arch=("any")
license=("MIT")
groups=()
depends=("pkgfile" "zsh")
makedepends=()
checkdepends=()
optdepends=("pamac-cli")
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("uninstall.sh" "cmd-not-found.zsh")
sha256sums=('4ea211759bb6f865f98c01eb972c8ba3a3040f785736c55d8183e6d12c68e3e9'
  'e63386d563b66c4aa1beae78052631c93b81922c5167af0bd8dfa858b31b447c')

noextract=()
validpgpkeys=()

package() {
  install -Dm755 "$srcdir/$pkgname.zsh" "$pkgdir/usr/share/zsh/functions/$pkgname.zsh"

  echo "Add the following line to your zshrc:"
  echo "  source /usr/share/zsh/functions/$pkgname.zsh"
}
