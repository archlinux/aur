# Maintainer: syst3mctl <support@usectl.com>
pkgname=usectl
pkgver=1.0.15
pkgrel=1
pkgdesc="CLI for the usectl self-hosted deployment platform"
arch=('x86_64' 'aarch64')
url="https://github.com/syst3mctl/usectl-cli"
license=('MIT')
depends=('glibc')
source_x86_64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('40af88b7d945f6506d2b4791800d6af9ad7880028a9a60f65f275f3cf22aa97b')
sha256sums_aarch64=('adcf18032d74f5e7a7304871663785a9c09bf9d15ce2264ad29298e16005e535')
package() {
  install -Dm755 usectl "$pkgdir/usr/bin/usectl"
}
