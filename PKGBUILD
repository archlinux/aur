pkgname=enumctl-bin
pkgver=2026.10.2
pkgrel=1
pkgdesc="CLI tool for enum"
arch=('x86_64' 'aarch64')
url="https://enum.co/"
keywords=('enum' 'cli' 'command-line' 'enumctl')
license=('Apache-2.0')
depends=('glibc')

source_x86_64=("enumctl-x86_64::https://dl.enum.co/enumctl/${pkgver}/enumctl-linux-amd64")
source_aarch64=("enumctl-aarch64::https://dl.enum.co/enumctl/${pkgver}/enumctl-linux-arm64")

sha256sums_x86_64=('38daf10a4f1c60f805691e36d833a9a1a7f016d4210b896b6b7e77f61cff45a5')
sha256sums_aarch64=('7d34510475ea56e13b18b0487f01595da99d732fce9dae4aa218ca4e4dd51e26')

package() {
  install -Dm755 enumctl-$CARCH "$pkgdir/usr/bin/enumctl"
}
