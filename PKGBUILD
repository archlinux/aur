pkgname=enumctl-bin
pkgver=2026.04.5
pkgrel=1
pkgdesc="CLI tool for enum"
arch=('x86_64' 'aarch64')
url="https://enum.co/"
keywords=('enum' 'cli' 'command-line' 'enumctl')
license=('custom')
depends=('glibc')

source_x86_64=("enumctl-x86_64::https://dl.enum.co/enumctl/${pkgver}/enumctl-linux-amd64")
source_aarch64=("enumctl-aarch64::https://dl.enum.co/enumctl/${pkgver}/enumctl-linux-arm64")

sha256sums_x86_64=('bc4ed0d056cf0df798cb4114ccd38d18f7abecd0144ac1705fc45bb1cf730f3c')
sha256sums_aarch64=('b8477864f2ed787ece61b3045f1d5ff6ea5124e2a0189196d95ff22b2f58030d')

package() {
  install -Dm755 enumctl-$CARCH "$pkgdir/usr/bin/enumctl"
}
