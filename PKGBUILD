# Maintainer: syst3mctl <support@usectl.com>
pkgname=usectl
pkgver=2.12.0
pkgrel=1
pkgdesc="CLI for the usectl deployment platform"
arch=('x86_64' 'aarch64')
url="https://github.com/syst3mctl/usectl-cli"
license=('MIT')
depends=('glibc')
source_x86_64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('82c24515d0cb592c5ef25f9d1f760c9cf93350fd831a49606860a081113389ba')
sha256sums_aarch64=('12a1510939c0a579d83890d52e6b0b7ee73cde574e154a280800393b0a002427')
package() {
  install -Dm755 usectl "$pkgdir/usr/bin/usectl"
}
