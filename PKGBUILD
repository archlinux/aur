# Maintainer: Omni <team@omni.dev>
pkgname=omnidotdev-cli-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Agentic CLI for the Omni ecosystem (pre-built)"
arch=('x86_64')
url="https://cli.omni.dev"
license=('MIT')
depends=()
provides=('omnidotdev-cli')
conflicts=('omnidotdev-cli')
source=("$pkgname-$pkgver.tar.gz::https://github.com/omnidotdev/cli/releases/download/v$pkgver/omni-x86_64-unknown-linux-gnu.tar.gz"
        "$pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/omnidotdev/cli/v$pkgver/LICENSE.md")

package() {
  install -Dm755 "omni" "$pkgdir/usr/bin/omni"
  install -Dm644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums=('e3bb95a7fb71ffc7556a8bf73abd15c13014ce930f2f2af16e1aa29112fc2790'
            '1de6fd7d97dd4debdf6719f5a8b90a3cb856532edfd4b81222e60c2489e7e0cd')
