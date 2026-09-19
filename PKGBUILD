# Maintainer: syst3mctl <support@usectl.com>
pkgname=usectl
pkgver=2.8.0
pkgrel=1
pkgdesc="CLI for the usectl deployment platform"
arch=('x86_64' 'aarch64')
url="https://github.com/syst3mctl/usectl-cli"
license=('MIT')
depends=('glibc')
source_x86_64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('577d3220f482315a579a405d32e867a42cf7b4ad7aaff79634fa7bf1527228b0')
sha256sums_aarch64=('6ea2a3ff9e82bb8293e6c4e927d734820f9e2c9903645606c9b08c0229a582e1')
package() {
  install -Dm755 usectl "$pkgdir/usr/bin/usectl"
}
