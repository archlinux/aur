# Maintainer: syst3mctl <support@usectl.com>
pkgname=usectl
pkgver=2.1.0
pkgrel=1
pkgdesc="CLI for the usectl deployment platform"
arch=('x86_64' 'aarch64')
url="https://github.com/syst3mctl/usectl-cli"
license=('MIT')
depends=('glibc')
source_x86_64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('68b39cdd7670c8750e63dcc5538b90eacc7879b83e2b43ff1df60721ba7f55b9')
sha256sums_aarch64=('e31e1ea4cb89e66c7b4fe7bb1564c890d8505df19d29ae7cf3f226a316aa978d')
package() {
  install -Dm755 usectl "$pkgdir/usr/bin/usectl"
}
