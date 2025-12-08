#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=tldx-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="Domain Availability Research Tool"
arch=('x86_64' 'aarch64')
conflicts=('tldx')
provides=('tldx')
source_x86_64=("$pkgname-$pkgver-x86_64.zip::https://github.com/brandonyoungdev/tldx/releases/download/v$pkgver/tldx_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.zip::https://github.com/brandonyoungdev/tldx/releases/download/v$pkgver/tldx_${pkgver}_linux_arm64.tar.gz")
url="https://github.com/brandonyoungdev/tldx"
license=("Apache-2.0")
sha256sums_x86_64=('7ac0e2d35c5beeef036cb35e6777c05a269be1a39ee4baee22ad33affc6e7486')
sha256sums_aarch64=('3eb074efbfd71e9c3695a96c5105684e75742e0bcae0fe438a65dc827400bf31')

package() {
  # Unpack, flag as executable and move to the right directory
  install -Dm755 "tldx" "$pkgdir/usr/bin/tldx"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/tldx/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/tldx/LICENSE"
}
