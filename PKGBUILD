# Maintainer: EvPix <EvPix@ya.ru>
pkgname=rust-analyzer-up
pkgver=1.0
pkgrel=2
pkgdesc="Bash script to manual update rust-analyzer from repository. Script update not needs."
arch=(x86_64)
url="https://aur.archlinux.org/packages/rust-analyzer-up"
license=('MIT')
groups=()
depends=(curl)
makedepends=()
optdepends=()
provides=(rust-analyzer)
conflicts=(rust-analyzer)
replaces=()
backup=()
options=()
install=
changelog=
source=(rust-analyzer-up.sh)
noextract=()
md5sums=(SKIP) #autofill using updpkgsums

build() {
  mv rust-analyzer-up.sh ~/.local/bin
}

package() {
  chmod +x ~/.local/bin/rust-analyzer-up.sh
  ~/.local/bin/rust-analyzer-up.sh
}
