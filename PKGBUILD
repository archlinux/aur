pkgname=enumctl-bin
pkgver=2026.09.4
pkgrel=1
pkgdesc="CLI tool for enum"
arch=('x86_64' 'aarch64')
url="https://enum.co/"
keywords=('enum' 'cli' 'command-line' 'enumctl')
license=('custom')
depends=('glibc')

source_x86_64=("enumctl-x86_64::https://dl.enum.co/enumctl/${pkgver}/enumctl-linux-amd64")
source_aarch64=("enumctl-aarch64::https://dl.enum.co/enumctl/${pkgver}/enumctl-linux-arm64")

sha256sums_x86_64=('d34a30c9fe295879da0d21dbf8b3fa5874efa4111e4cc6b324d00699830fe265')
sha256sums_aarch64=('47bd0bf5059fae92f1bbef835dc485d1cee0ccce95c4e743eea187d69fc2ba4b')

package() {
  install -Dm755 enumctl-$CARCH "$pkgdir/usr/bin/enumctl"
}
