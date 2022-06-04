# Maintainer: Juliette Cordor
pkgname="cmd-not-found"
pkgver="1.2.0"
pkgrel="1"
pkgdesc="A simple hook to display required packages when a command is not found"
url="https://github.com/jewlexx/cmd-not-found"
arch=("any")
license=("MIT")
groups=()
depends=("pkgfile" "zsh")
makedepends=()
checkdepends=()
optdepends=(
  "pamac-cli: Prompts user to enter password and fetches regular, aur, flatpak, snap, etc. packages"
  "yay: An aur helper that also prompts user to enter password and fetches regular and aur packages. (if both are installed, pamac is preferred)"
)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("uninstall.sh" "cmd-not-found.zsh")
sha256sums=('4ea211759bb6f865f98c01eb972c8ba3a3040f785736c55d8183e6d12c68e3e9'
  '61ba8632993f374b21b626c31e31fda87f6331f948429aa31fb06ab58f56b251')

noextract=()
validpgpkeys=()

package() {
  install -Dm755 "$srcdir/$pkgname.zsh" "$pkgdir/usr/share/zsh/functions/$pkgname.zsh"

  echo "Add the following line to your zshrc:"
  echo "  source /usr/share/zsh/functions/$pkgname.zsh"
}
