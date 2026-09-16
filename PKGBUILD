pkgname=enumctl-bin
pkgver=2026.09.10
pkgrel=1
pkgdesc="CLI tool for enum"
arch=('x86_64' 'aarch64')
url="https://enum.co/"
keywords=('enum' 'cli' 'command-line' 'enumctl')
license=('Apache-2.0')
depends=('glibc')

source_x86_64=("enumctl-x86_64::https://dl.enum.co/enumctl/${pkgver}/enumctl-linux-amd64")
source_aarch64=("enumctl-aarch64::https://dl.enum.co/enumctl/${pkgver}/enumctl-linux-arm64")

sha256sums_x86_64=('a5ead7809018509a5d09a2a955400ce4bf8982af889bf17481cd7dbc2b35b357')
sha256sums_aarch64=('211f1ca4674854a1657532f0bebab03b6f7ebbcc82e09e1a3a5763485766c945')

package() {
  install -Dm755 enumctl-$CARCH "$pkgdir/usr/bin/enumctl"
}
