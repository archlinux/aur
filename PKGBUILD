pkgname=enumctl-bin
pkgver=2026.09.11
pkgrel=1
pkgdesc="CLI tool for enum"
arch=('x86_64' 'aarch64')
url="https://enum.co/"
keywords=('enum' 'cli' 'command-line' 'enumctl')
license=('Apache-2.0')
depends=('glibc')

source_x86_64=("enumctl-x86_64::https://dl.enum.co/enumctl/${pkgver}/enumctl-linux-amd64")
source_aarch64=("enumctl-aarch64::https://dl.enum.co/enumctl/${pkgver}/enumctl-linux-arm64")

sha256sums_x86_64=('840a677481c3e1e49be8ee8eaebf70032fb5c842f06fb6061ee89c049cb7e3eb')
sha256sums_aarch64=('058f16ddc77873ed663aea40b2da5b680505d78998b503619a11866ce212e89c')

package() {
  install -Dm755 enumctl-$CARCH "$pkgdir/usr/bin/enumctl"
}
