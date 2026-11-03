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
sha256sums=('0dd7efd1d50878c004c6ff839d98bee1d83e0ad85ef35d4c03954cc20f65f197'
            '64d90764a9baac9d5f0797d6d9a7dfb26823396df09c872557e971cf76cc0a92')
