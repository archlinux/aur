# Maintainer: syst3mctl <support@usectl.com>
pkgname=usectl
pkgver=1.0.17
pkgrel=1
pkgdesc="CLI for the usectl self-hosted deployment platform"
arch=('x86_64' 'aarch64')
url="https://github.com/syst3mctl/usectl-cli"
license=('MIT')
depends=('glibc')
source_x86_64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('97a02324f2823be1f3b4234c4e0c07ac14a439b477287ca89bb5b811af3f3786')
sha256sums_aarch64=('83d5535a3a3e1be1d0d7f07455e9f8bb1e1b3573afa98bba16ea395c1cf3f7f7')
package() {
  install -Dm755 usectl "$pkgdir/usr/bin/usectl"
}
