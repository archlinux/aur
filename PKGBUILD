pkgname=enumctl-bin
pkgver=2026.06.2
pkgrel=1
pkgdesc="CLI tool for enum"
arch=('x86_64' 'aarch64')
url="https://enum.co/"
keywords=('enum' 'cli' 'command-line' 'enumctl')
license=('custom')
depends=('glibc')

source_x86_64=("enumctl-x86_64::https://dl.enum.co/enumctl/${pkgver}/enumctl-linux-amd64")
source_aarch64=("enumctl-aarch64::https://dl.enum.co/enumctl/${pkgver}/enumctl-linux-arm64")

sha256sums_x86_64=('3901d05b5fb07ccada2f5cfd362fb8aafdc3f473a1c061cef1da0f1b574cf8f4')
sha256sums_aarch64=('d8f0ac5c2e00e6889b70e8f2442d44d0d5d95f57b93ecc2f17bebd30381119ce')

package() {
  install -Dm755 enumctl-$CARCH "$pkgdir/usr/bin/enumctl"
}
