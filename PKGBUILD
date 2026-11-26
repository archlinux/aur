# Maintainer: syst3mctl <support@usectl.com>
pkgname=usectl
pkgver=2.17.0
pkgrel=1
pkgdesc="CLI for the usectl deployment platform"
arch=('x86_64' 'aarch64')
url="https://github.com/syst3mctl/usectl-cli"
license=('MIT')
depends=('glibc')
source_x86_64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('81b2c873c8f5ceb843b645282a23ac866c259c37c471a79868b3344f1bcfa5de')
sha256sums_aarch64=('2dacb7fa4c59308ae26387887f4c6a938c56da5a18a816cff129adc11cb28b3d')
package() {
  install -Dm755 usectl "$pkgdir/usr/bin/usectl"
}
