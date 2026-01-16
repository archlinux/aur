pkgname=enumctl-bin
pkgver=2026.01.15
pkgrel=1
pkgdesc="CLI tool for enum"
arch=('x86_64' 'aarch64')
url="https://enum.co/"
keywords=('enum' 'cli' 'command-line' 'enumctl')
license=('custom')
depends=('glibc')

source_x86_64=("enumctl-x86_64::https://dl.enum.co/enumctl/${pkgver}/enumctl-linux-amd64")
source_aarch64=("enumctl-aarch64::https://dl.enum.co/enumctl/${pkgver}/enumctl-linux-arm64")

sha256sums_x86_64=('2d28893b9e47f796c0ec28a9ed4ca3a53a0aca3c26c2cca57295dedcbf7e9b15')
sha256sums_aarch64=('c17ecd8d8f05520f0c9032f1f969d4020d82094a3d7ec5e4d85b088abaeb53d7')

package() {
  install -Dm755 enumctl-$CARCH "$pkgdir/usr/bin/enumctl"
}
