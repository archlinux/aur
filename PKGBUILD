# Maintainer: nitsky
arch=("x86_64")
license=("MIT")
pkgdesc="Tangram is an all-in-one automated machine learning framework."
pkgname=tangram-bin
pkgrel=1
pkgver=0.5.0
provides=("tangram")
sha256sums_x86_64=("c31ccfd497ee3c97c82267afe67aeaa18d22aea97c2348a23834d04c80a7ab6a")
source_x86_64=("https://github.com/tangramxyz/tangram/releases/download/v${pkgver}/tangram_cli_${pkgver}_x86_64-unknown-linux-gnu.tar.gz")
url='https://www.tangram.xyz'

package() {
  install -D -m 755 tangram "$pkgdir/usr/bin/tangram"
}
