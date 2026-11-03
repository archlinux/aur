# Maintainer: Omni <team@omni.dev>
pkgname=omnidotdev-taproot-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Auto-generate a full GraphQL API from a PostgreSQL database (pre-built)"
arch=('x86_64')
url="https://taproot.omni.dev"
license=('Apache-2.0')
depends=()
provides=('omnidotdev-taproot')
conflicts=('omnidotdev-taproot')
source=("$pkgname-$pkgver.tar.gz::https://github.com/omnidotdev/taproot/releases/download/v$pkgver/taproot-x86_64-unknown-linux-gnu.tar.gz"
        "$pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/omnidotdev/taproot/v$pkgver/LICENSE.md")

package() {
  install -Dm755 "taproot" "$pkgdir/usr/bin/taproot"
  install -Dm644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums=('e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'
            'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855')
