# Maintainer: Brahma Sharma <brahmasharma@dispostable.com>
pkgname=minecraft-free-bin
pkgver=0.0.23a_01
pkgrel=1
epoch=
pkgdesc="This package lets you run Minecraft for free."
arch=(x86_64)
url=""
license=('unknown')
groups=()
depends=()
makedepends=(wget)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://datahub.io/test/empty-txt/r/empty.txt")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

build() {
	wget https://github.com/Ganesha2282882/minecraft-free-edition/releases/download/continous/minecraft.linux.tgz
	mkdir mc
	tar xvpf minecraft.linux.tgz -C mc
}

package() {
	sudo cp -rvpf mc /opt 
}
