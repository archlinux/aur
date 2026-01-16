pkgname=enumctl-bin
pkgver=2026.01.14
pkgrel=2
pkgdesc="CLI tool for enum"
arch=('x86_64' 'aarch64')
url="https://enum.co/"
keywords=('enum' 'cli' 'command-line' 'enumctl')
license=('custom')
depends=('glibc')

source_x86_64=("enumctl-x86_64::https://dl.enum.co/enumctl/${pkgver}/enumctl-linux-amd64")
source_aarch64=("enumctl-aarch64::https://dl.enum.co/enumctl/${pkgver}/enumctl-linux-arm64")

sha256sums_x86_64=('353569d2957783ba2f3e51a5d0350597981b2ace82ae0acf5aace157da5ca4da')
sha256sums_aarch64=('994e3d321cca4ca3b5eb4f828096834d7d778dcec7c634cb0ada2978e0c7165b')

package() {
  install -Dm755 enumctl-$CARCH "$pkgdir/usr/bin/enumctl"
}
