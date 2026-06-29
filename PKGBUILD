# Maintainer: someoneonsmile <someoneonsmile@gmail.com>
pkgname=clip-cli-bin
conflicts=('clip' 'clip-bin')
provides=('clip')
pkgver=2.0.0
pkgrel=1
pkgdesc="System clipboard bridge for the terminal - pipe content in, paste content out"
arch=('x86_64' 'aarch64')
url="https://github.com/someoneonsmile/clip"
license=('MIT')

_source_base="${url}/releases/download/v${pkgver}"

source_x86_64=("${_source_base}/clip-x86_64-linux-gnu")
source_aarch64=("${_source_base}/clip-aarch64-linux-gnu")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
    cd "$srcdir"
    install -Dm755 "clip-${CARCH}-linux-gnu" "$pkgdir/usr/bin/clip"
}
