# Maintainer: syst3mctl <support@usectl.com>
pkgname=usectl
pkgver=1.0.21
pkgrel=1
pkgdesc="CLI for the usectl self-hosted deployment platform"
arch=('x86_64' 'aarch64')
url="https://github.com/syst3mctl/usectl-cli"
license=('MIT')
depends=('glibc')
source_x86_64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('1f24dceb9ad4d85062ce0b0cea40e0d6223161217e95d9305c37512df445528d')
sha256sums_aarch64=('692c648c7eda87cc3a4048a8bb1b0a26d282fa3ffedc8620e2b7eb0df0d0b0dd')
package() {
  install -Dm755 usectl "$pkgdir/usr/bin/usectl"
}
