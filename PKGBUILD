# Maintainer: syst3mctl <support@usectl.com>
pkgname=usectl
pkgver=2.0.1
pkgrel=1
pkgdesc="CLI for the usectl deployment platform"
arch=('x86_64' 'aarch64')
url="https://github.com/syst3mctl/usectl-cli"
license=('MIT')
depends=('glibc')
source_x86_64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('4a6ab9d456abaef13ba7e3dc9fd96c6343429d99b283b82e6059a1784af403b1')
sha256sums_aarch64=('ae3c920cd112e4131feb3a6159add5651931e6d761b63ddf14db2fefd46e5212')
package() {
  install -Dm755 usectl "$pkgdir/usr/bin/usectl"
}
