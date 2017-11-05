# Maintainer: Whyme Lyu <callme5long@gmail.com>
pkgname=wuzz-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Interactive cli tool for HTTP inspection"
arch=('x86_64')
url="https://github.com/asciimoo/wuzz"
license=('AGPL3')
makedepends=()
provides=('wuzz')
conflicts=('wuzz')
source=("wuzz-bin::https://github.com/asciimoo/wuzz/releases/download/v$pkgver/wuzz_linux_amd64")
noextract=('wuzz-bin')
sha256sums=(
  '5a1443e07a5a9b9bb813804290e87fdd27b544f4fe00ef95fe3b64e7b56459ec'
)

package() {
  cd "$srcdir"
  install -Dm755 wuzz-bin "$pkgdir/usr/bin/wuzz"
}
