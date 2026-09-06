# Maintainer: syst3mctl <support@usectl.com>
pkgname=usectl
pkgver=2.0.3
pkgrel=1
pkgdesc="CLI for the usectl deployment platform"
arch=('x86_64' 'aarch64')
url="https://github.com/syst3mctl/usectl-cli"
license=('MIT')
depends=('glibc')
source_x86_64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('fa9aa0197a6cea94e932517926baa52592ad0c25c53bf1b46170f7e94a8f4340')
sha256sums_aarch64=('67bf2c0cbe670443672a38d0198fc5ddea4d0ed973346cb30d77032ddc665b16')
package() {
  install -Dm755 usectl "$pkgdir/usr/bin/usectl"
}
