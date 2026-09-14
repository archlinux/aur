# Maintainer: syst3mctl <support@usectl.com>
pkgname=usectl
pkgver=2.2.0
pkgrel=1
pkgdesc="CLI for the usectl deployment platform"
arch=('x86_64' 'aarch64')
url="https://github.com/syst3mctl/usectl-cli"
license=('MIT')
depends=('glibc')
source_x86_64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('b592d932841d8f3bda58f010627dca500f7ecf8a6971de05c6518680ca660711')
sha256sums_aarch64=('235a5bfe7b911f74e141e40d7c5221591b3876470001ed53f886a959dada375a')
package() {
  install -Dm755 usectl "$pkgdir/usr/bin/usectl"
}
