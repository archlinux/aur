# Maintainer: syst3mctl <support@usectl.com>
pkgname=usectl
pkgver=1.0.20
pkgrel=1
pkgdesc="CLI for the usectl self-hosted deployment platform"
arch=('x86_64' 'aarch64')
url="https://github.com/syst3mctl/usectl-cli"
license=('MIT')
depends=('glibc')
source_x86_64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('75004a8d67e4a0b516bdda6059317d4b21c3e9c01cb17b3f5ffe2c4f0ce8452c')
sha256sums_aarch64=('0f935671dd6935a2f942b9a72498dbcbe751c5b8ed969fe8cfc01b5425ffc14a')
package() {
  install -Dm755 usectl "$pkgdir/usr/bin/usectl"
}
