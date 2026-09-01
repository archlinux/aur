# Maintainer: syst3mctl <support@usectl.com>
pkgname=usectl
pkgver=1.1.6
pkgrel=1
pkgdesc="CLI for the usectl deployment platform"
arch=('x86_64' 'aarch64')
url="https://github.com/syst3mctl/usectl-cli"
license=('MIT')
depends=('glibc')
source_x86_64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('fb8f4157428084eba5fb9fc7100845e5d592680ac908f6973b59a3c56dad1d83')
sha256sums_aarch64=('be3631a99d5711ce4df190ef42a20cc92e98e4bfb23527190aba4a109eb4312a')
package() {
  install -Dm755 usectl "$pkgdir/usr/bin/usectl"
}
