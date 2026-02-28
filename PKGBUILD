# Maintainer: Omni LLC <team@omni.dev>
pkgname=omnidotdev-cli-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Agentic CLI for the Omni ecosystem (pre-built)"
arch=('x86_64')
url="https://cli.omni.dev"
license=('MIT')
depends=()
provides=('omnidotdev-cli')
conflicts=('omnidotdev-cli')
source=("https://github.com/omnidotdev/cli/releases/download/v$pkgver/omni-x86_64-unknown-linux-gnu.tar.gz"
        "LICENSE::https://raw.githubusercontent.com/omnidotdev/cli/v$pkgver/LICENSE.md")
sha256sums=('68667d875de0e85e0949aa39c3dabbe7c2555aea9436cb8c65a9485dbc0a9586'
            '1de6fd7d97dd4debdf6719f5a8b90a3cb856532edfd4b81222e60c2489e7e0cd')

package() {
  install -Dm755 "omni" "$pkgdir/usr/bin/omni"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
