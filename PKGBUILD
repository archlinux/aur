# Maintainer: nitsky
arch=("x86_64")
license=("MIT")
pkgdesc="Tangram is an all-in-one machine learning toolkit designed for programmers."
pkgname=tangram
pkgrel=1
pkgver=0.3.0
provides=("tangram")
sha256sums_x86_64=("030a0ad71ce5ce3d84a71a83ebddefe06469de055eec9e43ccdba901fcffd51f")
source_x86_64=("https://github.com/tangramxyz/tangram/releases/download/v${pkgver}/tangram_cli_${pkgver}_x86_64-unknown-linux-gnu.tar.gz")
url='https://www.tangram.xyz'

package() {
  install -D -m 755 tangram "$pkgdir/usr/bin/tangram"
}
