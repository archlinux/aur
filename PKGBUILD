# Maintainer: byteowlz <dev@byteowlz.com>
pkgname=ignr
pkgver=0.1.2
pkgrel=1
pkgdesc="Auto-detect languages/tools and generate .gitignore files"
arch=('x86_64' 'aarch64')
url="https://github.com/byteowlz/ignr"
license=('MIT')
depends=('gcc-libs')
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/byteowlz/ignr/releases/download/v$pkgver/ignr-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::https://github.com/byteowlz/ignr/releases/download/v$pkgver/ignr-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('d14f072b8b56bdca5c86fb113644d60da76c26884831d30a9079c48e76f4fecd')
sha256sums_aarch64=('0a116cc23002bfcb87e512340bace852cf8485c5c3dce808d87c9f48f1aa4ab9')

package() {
    install -Dm755 ignr "$pkgdir/usr/bin/ignr"
}
