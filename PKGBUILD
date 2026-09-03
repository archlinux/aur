pkgname=enumctl-bin
pkgver=2026.09.3
pkgrel=1
pkgdesc="CLI tool for enum"
arch=('x86_64' 'aarch64')
url="https://enum.co/"
keywords=('enum' 'cli' 'command-line' 'enumctl')
license=('custom')
depends=('glibc')

source_x86_64=("enumctl-x86_64::https://dl.enum.co/enumctl/${pkgver}/enumctl-linux-amd64")
source_aarch64=("enumctl-aarch64::https://dl.enum.co/enumctl/${pkgver}/enumctl-linux-arm64")

sha256sums_x86_64=('2db4e0aa1b1c848ccddfa51ae4cd9c6cf1908ae939dfe02104e3765fbd08ea94')
sha256sums_aarch64=('99c9afe310b61f7e136e56cf06650039bad3d066d575f98c16b1aee1fa3ee5e5')

package() {
  install -Dm755 enumctl-$CARCH "$pkgdir/usr/bin/enumctl"
}
