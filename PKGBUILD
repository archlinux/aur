# Maintainer: obselate <obselate@users.noreply.github.com>
pkgname=bntui
pkgver=0.1.3
pkgrel=1
pkgdesc='Terminal block explorer for Blocknet privacy blockchain'
arch=('x86_64' 'aarch64')
url='https://github.com/obselate/bntui'
license=('MIT')
depends=('gcc-libs')
source_x86_64=("$pkgname-$pkgver-x86_64::https://github.com/obselate/bntui/releases/download/v$pkgver/bntui-linux-x86_64")
source_aarch64=("$pkgname-$pkgver-aarch64::https://github.com/obselate/bntui/releases/download/v$pkgver/bntui-linux-aarch64")
sha256sums_x86_64=('879e3594f6e44e5198e2218c8f7cd74960afbe5f4961284bd5b0fe45f3cb05c6')
sha256sums_aarch64=('5f94a1ec1ac9677df34aa0c239289379d582a171c899f6d8a94cf50108f93693')

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver-$(uname -m)" "$pkgdir/usr/bin/$pkgname"
}
