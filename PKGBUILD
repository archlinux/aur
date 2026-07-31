pkgname=enumctl-bin
pkgver=2026.07.3
pkgrel=1
pkgdesc="CLI tool for enum"
arch=('x86_64' 'aarch64')
url="https://enum.co/"
keywords=('enum' 'cli' 'command-line' 'enumctl')
license=('custom')
depends=('glibc')

source_x86_64=("enumctl-x86_64::https://dl.enum.co/enumctl/${pkgver}/enumctl-linux-amd64")
source_aarch64=("enumctl-aarch64::https://dl.enum.co/enumctl/${pkgver}/enumctl-linux-arm64")

sha256sums_x86_64=('8da680e726a17e465f50a71df9dd6a1a3293998b22af8b939f83edf774747d78')
sha256sums_aarch64=('7404ff550416b053d9fb77d82d2d3e9ef5695e5213f0d24e9372b3852fc04676')

package() {
  install -Dm755 enumctl-$CARCH "$pkgdir/usr/bin/enumctl"
}
