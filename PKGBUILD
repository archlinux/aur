#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=tldx-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="Domain Availability Research Tool"
arch=('x86_64' 'aarch64')
conflicts=('tldx')
provides=('tldx')
source_x86_64=("$pkgname-$pkgver-x86_64.zip::https://github.com/brandonyoungdev/tldx/releases/download/v$pkgver/tldx_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.zip::https://github.com/brandonyoungdev/tldx/releases/download/v$pkgver/tldx_${pkgver}_linux_arm64.tar.gz")
url="https://github.com/brandonyoungdev/tldx"
license=("Apache-2.0")
sha256sums_x86_64=('2b27104e2f45f5107bf70964abb47cea90d1a4b1177eafe46da95c231e3f6325')
sha256sums_aarch64=('9ddb0dcdfe23a33fbcf59f7d828e5ec50c0727c9902a670507e77dd368410fdb')

package() {
  # Unpack, flag as executable and move to the right directory
  install -Dm755 "tldx" "$pkgdir/usr/bin/tldx"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/tldx/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/tldx/LICENSE"
}
