pkgname=enumctl-bin
pkgver=2026.06.3
pkgrel=1
pkgdesc="CLI tool for enum"
arch=('x86_64' 'aarch64')
url="https://enum.co/"
keywords=('enum' 'cli' 'command-line' 'enumctl')
license=('custom')
depends=('glibc')

source_x86_64=("enumctl-x86_64::https://dl.enum.co/enumctl/${pkgver}/enumctl-linux-amd64")
source_aarch64=("enumctl-aarch64::https://dl.enum.co/enumctl/${pkgver}/enumctl-linux-arm64")

sha256sums_x86_64=('cce63e87d6f42c5bb86f6db5d67c5f1eef38cc0b9b2567bbf236fd495268db06')
sha256sums_aarch64=('dd10af443448f6e012efbf999510f21a158720d52c8f06ac02e4d452201d5fd9')

package() {
  install -Dm755 enumctl-$CARCH "$pkgdir/usr/bin/enumctl"
}
