# Maintainer: syst3mctl <support@usectl.com>
pkgname=usectl
pkgver=1.0.10
pkgrel=1
pkgdesc="CLI for the usectl self-hosted deployment platform"
arch=('x86_64' 'aarch64')
url="https://github.com/syst3mctl/usectl-cli"
license=('MIT')
depends=('glibc')
source_x86_64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('8904627e82030cd4bb49111d3c8f64816c97786d9fc54d751a8bad526de8ac67')
sha256sums_aarch64=('22381a0f25ac0dd6fcf18690dca466525054f043990415285245dd8e8a189016')
package() {
  install -Dm755 usectl "$pkgdir/usr/bin/usectl"
}
