# Maintainer: Omni <team@omni.dev>
pkgname=omnidotdev-kiln-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Zero-config source-to-image container builder (pre-built)"
arch=('x86_64')
url="https://kiln.omni.dev"
license=('Apache-2.0')
depends=()
provides=('omnidotdev-kiln')
conflicts=('omnidotdev-kiln')
source=("$pkgname-$pkgver.tar.gz::https://github.com/omnidotdev/kiln/releases/download/v$pkgver/kiln-x86_64-unknown-linux-gnu.tar.gz"
        "$pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/omnidotdev/kiln/v$pkgver/LICENSE.md")

package() {
  install -Dm755 "kiln" "$pkgdir/usr/bin/kiln"
  install -Dm644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums=('ed550367c9b0b9905e56ab15c3597c3a55d0c51608d83b000bf40e704b039c78'
            '64d90764a9baac9d5f0797d6d9a7dfb26823396df09c872557e971cf76cc0a92')
