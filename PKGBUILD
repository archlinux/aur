pkgname=enumctl-bin
pkgver=2026.09.6
pkgrel=1
pkgdesc="CLI tool for enum"
arch=('x86_64' 'aarch64')
url="https://enum.co/"
keywords=('enum' 'cli' 'command-line' 'enumctl')
license=('custom')
depends=('glibc')

source_x86_64=("enumctl-x86_64::https://dl.enum.co/enumctl/${pkgver}/enumctl-linux-amd64")
source_aarch64=("enumctl-aarch64::https://dl.enum.co/enumctl/${pkgver}/enumctl-linux-arm64")

sha256sums_x86_64=('e9f98b870584226aefc60322b0f518ea0df728cc3793882771506cba799ff771')
sha256sums_aarch64=('fd9daf8aa5aed7060cd52e45e1044fdc05aa498e3b4ad4e89066c67849eb9085')

package() {
  install -Dm755 enumctl-$CARCH "$pkgdir/usr/bin/enumctl"
}
