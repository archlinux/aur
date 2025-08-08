# Maintainer: Evan Burkey <evan@burkey.co>
pkgname=epochcli
pkgver=1.1.2
pkgrel=1
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
source=("git+https://git.burkey.co/eburk/epochcli#commit=92c1ce74e53b0f71f110af4f076f79503cd35333")
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
