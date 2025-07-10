# Maintainer: Evan Burkey <evan@burkey.co>
pkgname=epochcli
pkgver=1.0.6
pkgrel=6
epoch=
pkgdesc="Updater and launcher for Project Epoch"
arch=('x86_64')
url="https://git.burkey.co/eburk/epochcli"
license=('ISC')
makedepends=('go>=1.24.0')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=("git+https://git.burkey.co/eburk/epochcli#commit=2cb22084785a4ca22b55cf7a798741077de10d05") 
noextract=()
sha256sums=("SKIP")

build() {
	pushd epochcli
	go build
}

package() {
	pushd epochcli 
	install -v -D -m0755 epochcli ${pkgdir}/usr/bin/epochcli
}
