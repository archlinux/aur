# Maintainer: Evan Burkey <evan@burkey.co>
pkgname=epochcli
pkgver=1.0.1
pkgrel=2
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
source=("git+https://git.burkey.co/eburk/epochcli#commit=af8a2dbd1e67b224f38d9b3d64e7c5e6dd6b322c") 
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
