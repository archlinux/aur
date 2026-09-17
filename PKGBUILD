# Maintainer: syst3mctl <support@usectl.com>
pkgname=usectl
pkgver=2.7.0
pkgrel=1
pkgdesc="CLI for the usectl deployment platform"
arch=('x86_64' 'aarch64')
url="https://github.com/syst3mctl/usectl-cli"
license=('MIT')
depends=('glibc')
source_x86_64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('fc40576755eac849a678d2d139cb641144025a93ccb09fe88d1dc424c21550b3')
sha256sums_aarch64=('46844c2f44d1621e2d2dd11ab3693e93c4ea62d06c7bfe0bcc0877519b8e6447')
package() {
  install -Dm755 usectl "$pkgdir/usr/bin/usectl"
}
