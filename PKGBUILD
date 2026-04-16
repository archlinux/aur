# Maintainer: syst3mctl <support@usectl.com>
pkgname=usectl
pkgver=1.0.19
pkgrel=1
pkgdesc="CLI for the usectl self-hosted deployment platform"
arch=('x86_64' 'aarch64')
url="https://github.com/syst3mctl/usectl-cli"
license=('MIT')
depends=('glibc')
source_x86_64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('3ba2bee57d14bbb2e5dc91e4bd42a59017f791ced8408e71103a99392887cf81')
sha256sums_aarch64=('677ade942d99665362021cb0fe880ed91a024042ebd7a9c05b64166b5e7e1a95')
package() {
  install -Dm755 usectl "$pkgdir/usr/bin/usectl"
}
