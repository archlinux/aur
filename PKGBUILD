# Maintainer: someoneonsmile <someoneonsmile@gmail.com>
pkgname=clip-cli-nightly-bin
conflicts=('clip' 'clip-bin' 'clip-cli-bin')
provides=('clip')
pkgver=20260701
pkgrel=1
pkgdesc="System clipboard bridge for the terminal — nightly build (pipe content in, paste content out)"
arch=('x86_64' 'aarch64')
url="https://github.com/someoneonsmile/clip"
license=('MIT')

_source_base="${url}/releases/download/nightly"

source_x86_64=("${_source_base}/clip-x86_64-linux-gnu")
source_aarch64=("${_source_base}/clip-aarch64-linux-gnu")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
    cd "$srcdir"
    install -Dm755 "clip-${CARCH}-linux-gnu" "$pkgdir/usr/bin/clip"
}
