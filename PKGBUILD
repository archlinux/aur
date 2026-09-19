# Maintainer: syst3mctl <support@usectl.com>
pkgname=usectl
pkgver=2.7.1
pkgrel=1
pkgdesc="CLI for the usectl deployment platform"
arch=('x86_64' 'aarch64')
url="https://github.com/syst3mctl/usectl-cli"
license=('MIT')
depends=('glibc')
source_x86_64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('5b53770505dc9124c53ade69645ca09277614f2968a5f673067cf6d1ccbba3e8')
sha256sums_aarch64=('0a62813bc51a5549382bfbbabbd6771f1592bc2a7adb2394df9b1c2fecbf23f9')
package() {
  install -Dm755 usectl "$pkgdir/usr/bin/usectl"
}
