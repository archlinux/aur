# Maintainer: someoneonsmile <someoneonsmile@gmail.com>
pkgname=deref-bin
provides=('deref')
conflicts=('deref')
pkgver=0.1.0
pkgrel=1
pkgdesc="Replace symbolic links with real files / directories"
arch=('x86_64' 'aarch64')
url="https://github.com/someoneonsmile/deref"
license=('MIT')

_source_base="${url}/releases/download/v${pkgver}"

source_x86_64=("${_source_base}/deref-x86_64-linux-gnu")
source_aarch64=("${_source_base}/deref-aarch64-linux-gnu")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
    cd "$srcdir"
    install -Dm755 "deref-${CARCH}-linux-gnu" "$pkgdir/usr/bin/deref"
}
