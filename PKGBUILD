# Maintainer: syst3mctl <support@usectl.com>
pkgname=usectl
pkgver=2.0.2
pkgrel=1
pkgdesc="CLI for the usectl deployment platform"
arch=('x86_64' 'aarch64')
url="https://github.com/syst3mctl/usectl-cli"
license=('MIT')
depends=('glibc')
source_x86_64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('b4a1df8fd32c1ef021b3388b1449c86e7a14bff692923cf75d457e4fd8a306c7')
sha256sums_aarch64=('3ed609e7d465023cae7595148d1500536dda29dc71122f00bc0dce1af1742ac7')
package() {
  install -Dm755 usectl "$pkgdir/usr/bin/usectl"
}
