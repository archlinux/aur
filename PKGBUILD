# Maintainer: p3nguin-kun <p3nguinkun@proton.me>
pkgname=lmaofetch
pkgver=1.1
pkgrel=1
epoch=
pkgdesc="A simple system fetch written in Bash"
arch=('any')
url="https://github.com/p3nguin-kun/lmaofetch"
license=('MIT')
groups=('unknown')
depends=('bash')
makedepends=('git')
checkdepends=()
optdepends=('nerd-fonts: Icon font')
provides=()
conflicts=()
replaces=()
backup=()
options=()
#install=
changelog=
source=("$pkgname::git+https://github.com/p3nguin-kun/lmaofetch")
noextract=()
sha512sums=('SKIP')

prepare() {
    sudo pacman -S --noconfirm ttf-nerd-fonts-symbols
}

package() {
  cd $pkgname
  make install
}
