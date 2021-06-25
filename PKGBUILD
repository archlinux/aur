# Maintainer: nitsky
arch=("x86_64")
license=("MIT")
pkgdesc="Tangram is an automated machine learning framework designed for programmers."
pkgname=tangram-bin
pkgrel=1
pkgver=0.4.0
provides=("tangram")
sha256sums_x86_64=("bc225b86b1dfd905beee6cb97b6bf6a5a6b4d87dc97b64308ac081c49eddf176")
source_x86_64=("https://github.com/tangramxyz/tangram/releases/download/v${pkgver}/tangram_cli_${pkgver}_x86_64-unknown-linux-gnu.tar.gz")
url='https://www.tangram.xyz'

package() {
  install -D -m 755 tangram "$pkgdir/usr/bin/tangram"
}
