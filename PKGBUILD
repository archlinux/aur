# Maintainer: syst3mctl <support@usectl.com>
pkgname=usectl
pkgver=2.14.0
pkgrel=1
pkgdesc="CLI for the usectl deployment platform"
arch=('x86_64' 'aarch64')
url="https://github.com/syst3mctl/usectl-cli"
license=('MIT')
depends=('glibc')
source_x86_64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('8881c351c657a44f04a7159d20324c287a290ce8a8a9995274d6d2dad33d865d')
sha256sums_aarch64=('06b58bdce3240881ae2b69ef53115b1d37ebd9c4380e03fc78978d09fd529be8')
package() {
  install -Dm755 usectl "$pkgdir/usr/bin/usectl"
}
