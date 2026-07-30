pkgname=enumctl-bin
pkgver=2026.07.2
pkgrel=1
pkgdesc="CLI tool for enum"
arch=('x86_64' 'aarch64')
url="https://enum.co/"
keywords=('enum' 'cli' 'command-line' 'enumctl')
license=('custom')
depends=('glibc')

source_x86_64=("enumctl-x86_64::https://dl.enum.co/enumctl/${pkgver}/enumctl-linux-amd64")
source_aarch64=("enumctl-aarch64::https://dl.enum.co/enumctl/${pkgver}/enumctl-linux-arm64")

sha256sums_x86_64=('7bca0a195357865190dfd975fb9901288fc00619d658aa82e94d21ce6b50903a')
sha256sums_aarch64=('a002522d9e4d7137fff3807f24f2cea526598a059c8691eae8a5f36d94bf6f5a')

package() {
  install -Dm755 enumctl-$CARCH "$pkgdir/usr/bin/enumctl"
}
