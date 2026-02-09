# Maintainer: obselate <obselate@users.noreply.github.com>
pkgname=bntui
pkgver=0.1.1
pkgrel=1
pkgdesc='Terminal block explorer for Blocknet privacy blockchain'
arch=('x86_64' 'aarch64')
url='https://github.com/obselate/bntui'
license=('MIT')
depends=('gcc-libs')
source_x86_64=("$pkgname-$pkgver-x86_64::https://github.com/obselate/bntui/releases/download/v$pkgver/bntui-linux-x86_64")
source_aarch64=("$pkgname-$pkgver-aarch64::https://github.com/obselate/bntui/releases/download/v$pkgver/bntui-linux-aarch64")
sha256sums_x86_64=('1fda63c6ccd081dbd95eed63475e48291c4840eb6949691e81a503f94aab65c1')
sha256sums_aarch64=('c8a56e9682d8b1f18ee3ef8a73cfb841242cf3c00c9ea776379f906db337fbd7')

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver-$(uname -m)" "$pkgdir/usr/bin/$pkgname"
}
