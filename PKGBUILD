# Maintainer: p3nguin-kun <p3nguinkun@proton.me>
pkgname=lmaofetch
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="A simple system fetch written in Bash"
arch=('any')
url="https://codeberg.org/p3nguin-kun/lmaofetch"
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
source=("$pkgname::git+https://codeberg.org/p3nguin-kun/lmaofetch")
noextract=()
sha512sums=('SKIP')

prepare() {
    sudo pacman -S nerd-fonts
}

build() {
	cd $pkgname
}

package() {
	cd $pkgname
	sudo cp lmaofetch /usr/bin
    sudo chmod +x /usr/bin/lmaofetch
}
