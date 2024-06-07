# Maintainer: sineptic <sineptic0@gmail.com>
pkgsubn=vimium
pkgname=chromium-vimium
pkgver=2.1.2
pkgrel=1
pkgdesc="Browser extension that provides keyboard-based navigation (unpacked)"
arch=('any')
url="https://github.com/philc/vimium"
license=('MIT')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    mkdir -p "$pkgdir/usr/share/"

    cd "$pkgsubn-$pkgver"
    cp -r --no-preserve=ownership . "$pkgdir/usr/share/$pkgname-$pkgver"
}
