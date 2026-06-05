pkgname=enumctl-bin
pkgver=2026.06.1
pkgrel=1
pkgdesc="CLI tool for enum"
arch=('x86_64' 'aarch64')
url="https://enum.co/"
keywords=('enum' 'cli' 'command-line' 'enumctl')
license=('custom')
depends=('glibc')

source_x86_64=("enumctl-x86_64::https://dl.enum.co/enumctl/${pkgver}/enumctl-linux-amd64")
source_aarch64=("enumctl-aarch64::https://dl.enum.co/enumctl/${pkgver}/enumctl-linux-arm64")

sha256sums_x86_64=('c978b4f44cbaeaff1d133f4dcbd71ce0536fbb6e20e7e78d4022843f2e467993')
sha256sums_aarch64=('5f5bfb499158a2e07be24cc87ed1145f9f33d135ff7a26601b4921704cef3b24')

package() {
  install -Dm755 enumctl-$CARCH "$pkgdir/usr/bin/enumctl"
}
