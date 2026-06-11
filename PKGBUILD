pkgname=enumctl-bin
pkgver=2026.06.4
pkgrel=1
pkgdesc="CLI tool for enum"
arch=('x86_64' 'aarch64')
url="https://enum.co/"
keywords=('enum' 'cli' 'command-line' 'enumctl')
license=('custom')
depends=('glibc')

source_x86_64=("enumctl-x86_64::https://dl.enum.co/enumctl/${pkgver}/enumctl-linux-amd64")
source_aarch64=("enumctl-aarch64::https://dl.enum.co/enumctl/${pkgver}/enumctl-linux-arm64")

sha256sums_x86_64=('e6c55e9fad5841a5ae553061bb83ae9ccbea9fc8b53339759338e1160a3780b1')
sha256sums_aarch64=('37f6b7929bd10a10694a9c4060c0a0ee569f43d0d799bbf7c111d428b614f71c')

package() {
  install -Dm755 enumctl-$CARCH "$pkgdir/usr/bin/enumctl"
}
