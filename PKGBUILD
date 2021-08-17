# Maintainer: nitsky
arch=("x86_64")
license=("MIT")
pkgdesc="Tangram makes it easy for programmers to train, deploy, and monitor machine learning models."
pkgname=tangram-bin
pkgrel=1
pkgver=0.7.0
provides=("tangram")
sha256sums_x86_64=("4e2b86675a879e218b92e18d9fe3092ba3dba0cfb06cf8a77dc09910130a68ca")
source_x86_64=("https://github.com/tangramdotdev/tangram/releases/download/v${pkgver}/tangram_cli_${pkgver}_x86_64-unknown-linux-gnu.tar.gz")
url='https://www.tangram.dev'

package() {
  install -D -m 755 tangram "$pkgdir/usr/bin/tangram"
}
