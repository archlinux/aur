# Maintainer: syst3mctl <support@usectl.com>
pkgname=usectl
pkgver=2.13.0
pkgrel=1
pkgdesc="CLI for the usectl deployment platform"
arch=('x86_64' 'aarch64')
url="https://github.com/syst3mctl/usectl-cli"
license=('MIT')
depends=('glibc')
source_x86_64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('a7bea119a17cad2a9452ed768851b7bcbee8a77872a9bb6366858fbb25ba1015')
sha256sums_aarch64=('9dda813393257b9582f16ad2ccd339607b3e4e22c083c8c833ca0ff0f16ef234')
package() {
  install -Dm755 usectl "$pkgdir/usr/bin/usectl"
}
