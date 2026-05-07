# Maintainer: syst3mctl <support@usectl.com>
pkgname=usectl
pkgver=1.1.0
pkgrel=1
pkgdesc="CLI for the usectl self-hosted deployment platform"
arch=('x86_64' 'aarch64')
url="https://github.com/syst3mctl/usectl-cli"
license=('MIT')
depends=('glibc')
source_x86_64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('7e7a87438e3e6ccf0a3c8d56cf7307f9a9707907ce8aa8cfc123b6aca6e653a1')
sha256sums_aarch64=('e896a832dd344a90561ef33806b48ad9b40a870e30bf79554bacfd7e2af32075')
package() {
  install -Dm755 usectl "$pkgdir/usr/bin/usectl"
}
