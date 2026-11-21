# Maintainer: syst3mctl <support@usectl.com>
pkgname=usectl
pkgver=2.16.0
pkgrel=1
pkgdesc="CLI for the usectl deployment platform"
arch=('x86_64' 'aarch64')
url="https://github.com/syst3mctl/usectl-cli"
license=('MIT')
depends=('glibc')
source_x86_64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('42170ba5c7b904ce2f98b01907e8ee6d54bb94710d7c8b6920495efa1dbcee9e')
sha256sums_aarch64=('a7c12a61caf097ed622adea31c97df23938b610643e352450d2501022cdcba44')
package() {
  install -Dm755 usectl "$pkgdir/usr/bin/usectl"
}
