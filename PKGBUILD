# Maintainer: byteowlz <dev@byteowlz.com>
pkgname=ignr
pkgver=0.1.1
pkgrel=1
pkgdesc="Auto-detect languages/tools and generate .gitignore files"
arch=('x86_64' 'aarch64')
url="https://github.com/byteowlz/ignr"
license=('MIT')
depends=('gcc-libs')
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/byteowlz/ignr/releases/download/v$pkgver/ignr-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::https://github.com/byteowlz/ignr/releases/download/v$pkgver/ignr-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('7d8207d253fe9d608287b3630af1f362886519045b4dc33654e514060620ffa5')
sha256sums_aarch64=('21a50ed2bd7077375e73fa42425920e0aa33ea85a17d69c114719a3ad5503ae4')

package() {
    install -Dm755 ignr "$pkgdir/usr/bin/ignr"
}
