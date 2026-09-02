pkgname=enumctl-bin
pkgver=2026.09.1
pkgrel=1
pkgdesc="CLI tool for enum"
arch=('x86_64' 'aarch64')
url="https://enum.co/"
keywords=('enum' 'cli' 'command-line' 'enumctl')
license=('custom')
depends=('glibc')

source_x86_64=("enumctl-x86_64::https://dl.enum.co/enumctl/${pkgver}/enumctl-linux-amd64")
source_aarch64=("enumctl-aarch64::https://dl.enum.co/enumctl/${pkgver}/enumctl-linux-arm64")

sha256sums_x86_64=('25f8169cd1d15e2cd41d9987d248ba5f9cb59012477842dcae1ff379ecb431d7')
sha256sums_aarch64=('036e12ae798c8a37b1df37be287f3c72f15377a898a3963dc73e6d1a971c2b66')

package() {
  install -Dm755 enumctl-$CARCH "$pkgdir/usr/bin/enumctl"
}
