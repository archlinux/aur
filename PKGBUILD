pkgname=enumctl-bin
pkgver=2026.09.7
pkgrel=1
pkgdesc="CLI tool for enum"
arch=('x86_64' 'aarch64')
url="https://enum.co/"
keywords=('enum' 'cli' 'command-line' 'enumctl')
license=('custom')
depends=('glibc')

source_x86_64=("enumctl-x86_64::https://dl.enum.co/enumctl/${pkgver}/enumctl-linux-amd64")
source_aarch64=("enumctl-aarch64::https://dl.enum.co/enumctl/${pkgver}/enumctl-linux-arm64")

sha256sums_x86_64=('076c68d2aece6994f8ebfc3cf6eb72eb91ac961b41dab9ffc737bb4359f4fe23')
sha256sums_aarch64=('e949a4ba5b23c2b5f60beab1dff6496b82089c8f3a0a4b24ab0a2cb1b38569e4')

package() {
  install -Dm755 enumctl-$CARCH "$pkgdir/usr/bin/enumctl"
}
