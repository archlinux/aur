# Maintainer: syst3mctl <support@usectl.com>
pkgname=usectl
pkgver=2.0.0
pkgrel=1
pkgdesc="CLI for the usectl deployment platform"
arch=('x86_64' 'aarch64')
url="https://github.com/syst3mctl/usectl-cli"
license=('MIT')
depends=('glibc')
source_x86_64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('91f454762e0c5e5306448c638d4fd9141d64cdceef4bfa5c97937424544f5589')
sha256sums_aarch64=('b85951cd12ba9c712bd9cf6c17cb939c6c914bfc08b3e2bd5266e9a9734716e8')
package() {
  install -Dm755 usectl "$pkgdir/usr/bin/usectl"
}
