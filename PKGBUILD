# Maintainer: syst3mctl <support@usectl.com>
pkgname=usectl
pkgver=1.0.5
pkgrel=1
pkgdesc="CLI for the usectl self-hosted deployment platform"
arch=('x86_64' 'aarch64')
url="https://github.com/syst3mctl/usectl-cli"
license=('MIT')
depends=('glibc')
source_x86_64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('37bb2ffd833af6b68d871f826f0dbf0a06bb89b5883a4e1b383bebe2233f35c1')
sha256sums_aarch64=('02e288f6762149476437eafb0aaf93d759e9d82e7d8778b3a79a2e8741758608')
package() {
  install -Dm755 usectl "$pkgdir/usr/bin/usectl"
}
