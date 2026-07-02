# Maintainer: syst3mctl <support@usectl.com>
pkgname=usectl
pkgver=1.1.4
pkgrel=1
pkgdesc="CLI for the usectl deployment platform"
arch=('x86_64' 'aarch64')
url="https://github.com/syst3mctl/usectl-cli"
license=('MIT')
depends=('glibc')
source_x86_64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('1b5582839d62533c7224aafe7149831f5231db60cbeb3f04f9afd80161210b12')
sha256sums_aarch64=('88122b4bfb3638e9c73bde7311858e7ba0533a1f76a6f514467d4ff13b7f9754')
package() {
  install -Dm755 usectl "$pkgdir/usr/bin/usectl"
}
