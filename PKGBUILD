# Maintainer: someoneonsmile <someoneonsmile@gmail.com>
pkgname=deref-nightly-bin
provides=('deref')
conflicts=('deref' 'deref-bin')
pkgver=20260721
pkgrel=1
pkgdesc="Replace symbolic links with real files / directories — nightly build"
arch=('x86_64' 'aarch64')
url="https://github.com/someoneonsmile/deref"
license=('MIT')

_source_base="${url}/releases/download/nightly"

source_x86_64=("${_source_base}/deref-x86_64-linux-gnu")
source_aarch64=("${_source_base}/deref-aarch64-linux-gnu")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
    cd "$srcdir"
    install -Dm755 "deref-${CARCH}-linux-gnu" "$pkgdir/usr/bin/deref"
}
