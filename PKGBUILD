# Maintainer: syst3mctl <support@usectl.com>
pkgname=usectl
pkgver=2.11.2
pkgrel=1
pkgdesc="CLI for the usectl deployment platform"
arch=('x86_64' 'aarch64')
url="https://github.com/syst3mctl/usectl-cli"
license=('MIT')
depends=('glibc')
source_x86_64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('00d0bfcb13430b185ff0f3ab00e3d6c7c797a0f2db304e74ed785e7fa50f94b5')
sha256sums_aarch64=('3bd2ad8bda0e44a9113c787784f35e4e4cddc079d0763eca12c2448542f5456e')
package() {
  install -Dm755 usectl "$pkgdir/usr/bin/usectl"
}
