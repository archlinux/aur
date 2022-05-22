# Maintainer: Hristo Tanev <hristo.tanev@outlook.com>
pkgname=dotfiles-hristotanev-git
pkgver=1.0.2
pkgrel=1
pkgdesc="This is my personal set of .dotfiles and some other configs"
arch=(x86_64)
url="https://github.com/hristotanev/.dotfiles.git"
license=('GPL')
groups=()
depends=()
makedepends=(git rcm)
checkdepends=()
optdepends=()
provides=(dotfiles)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

package() {
  cd .dotfiles
  mkdir $HOME/.dotfiles && cp -rf * $HOME/.dotfiles
  ~/.dotfiles/install.sh
}
