# Maintainer: syst3mctl <support@usectl.com>
pkgname=usectl
pkgver=1.0.13
pkgrel=1
pkgdesc="CLI for the usectl self-hosted deployment platform"
arch=('x86_64' 'aarch64')
url="https://github.com/syst3mctl/usectl-cli"
license=('MIT')
depends=('glibc')
source_x86_64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('9094aecc845e6452d26690ce1410be21e04e8eb2d6f17c612f4a54fd7090ee37')
sha256sums_aarch64=('ddcef662a0359c6e03c64b2939a29743157827c05c3abd7706d8c90d48694213')
package() {
  install -Dm755 usectl "$pkgdir/usr/bin/usectl"
}
