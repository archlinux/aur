# Maintainer: syst3mctl <support@usectl.com>
pkgname=usectl
pkgver=2.6.0
pkgrel=1
pkgdesc="CLI for the usectl deployment platform"
arch=('x86_64' 'aarch64')
url="https://github.com/syst3mctl/usectl-cli"
license=('MIT')
depends=('glibc')
source_x86_64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('33d367849667dcb74f146fafd1b3993db89420b062ff39dcb2c046c727d32a36')
sha256sums_aarch64=('053608355a0419b837b46ce95b65fb6b654cc721735f0855a79aa15837ed01c0')
package() {
  install -Dm755 usectl "$pkgdir/usr/bin/usectl"
}
