# Maintainer: nitsky
arch=("x86_64")
license=("MIT")
pkgdesc="Tangram is an all-in-one automated machine learning framework."
pkgname=tangram-bin
pkgrel=1
pkgver=0.6.0
provides=("tangram")
sha256sums_x86_64=("14cfd651fbfa80fdb436e56d6fba27106d08a9d9765f8302f85c7105daa0ee78")
source_x86_64=("https://github.com/tangramdotdev/tangram/releases/download/v${pkgver}/tangram_cli_${pkgver}_x86_64-unknown-linux-gnu.tar.gz")
url='https://www.tangram.dev'

package() {
  install -D -m 755 tangram "$pkgdir/usr/bin/tangram"
}
