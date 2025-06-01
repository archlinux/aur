#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=tldx-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Domain Availability Research Tool"
arch=('x86_64' 'aarch64')
conflicts=('tldx')
provides=('tldx')
source_x86_64=("$pkgname-$pkgver-x86_64.zip::https://github.com/brandonyoungdev/tldx/releases/download/v$pkgver/tldx_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.zip::https://github.com/brandonyoungdev/tldx/releases/download/v$pkgver/tldx_${pkgver}_linux_arm64.tar.gz")
url="https://github.com/brandonyoungdev/tldx"
license=("Apache-2.0")
sha256sums_x86_64=('47c735fa3ab3cd7765e1aed8313d7b8f40348d07673ba2baf1259ad96be490f0')
sha256sums_aarch64=('b6fa3542c1aee9518b691773d8fed24034292cca49a68605ca36757049676ffd')

package() {
  # Unpack, flag as executable and move to the right directory
  install -Dm755 "tldx" "$pkgdir/usr/bin/tldx"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/tldx/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/tldx/LICENSE"
}
