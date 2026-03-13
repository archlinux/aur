# Maintainer: syst3mctl <support@usectl.com>
pkgname=usectl
pkgver=1.0.4
pkgrel=1
pkgdesc="CLI for the usectl self-hosted deployment platform"
arch=('x86_64' 'aarch64')
url="https://github.com/syst3mctl/usectl-cli"
license=('MIT')
depends=('glibc')
source_x86_64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('568e9a330196d057b96c74b86cfd1127007f7a060f3818fa33683814ee9d2efb')
sha256sums_aarch64=('0a7c9a85968a6d563cab53f06dbae8414a52e91da3eb8322433520e1e85619f9')
package() {
  install -Dm755 usectl "$pkgdir/usr/bin/usectl"
}
