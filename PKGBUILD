pkgname=enumctl-bin
pkgver=2026.09.5
pkgrel=1
pkgdesc="CLI tool for enum"
arch=('x86_64' 'aarch64')
url="https://enum.co/"
keywords=('enum' 'cli' 'command-line' 'enumctl')
license=('custom')
depends=('glibc')

source_x86_64=("enumctl-x86_64::https://dl.enum.co/enumctl/${pkgver}/enumctl-linux-amd64")
source_aarch64=("enumctl-aarch64::https://dl.enum.co/enumctl/${pkgver}/enumctl-linux-arm64")

sha256sums_x86_64=('976b1d4eddc30959feeba16afc7ab768ad9494ecb152d2adff136cf194104637')
sha256sums_aarch64=('1eb0f6ce6a3bb2f60622cb10e098183b09b180b4ac035e535eeb1de11faa4ee1')

package() {
  install -Dm755 enumctl-$CARCH "$pkgdir/usr/bin/enumctl"
}
