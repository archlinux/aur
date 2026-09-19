# Maintainer: syst3mctl <support@usectl.com>
pkgname=usectl
pkgver=2.10.0
pkgrel=1
pkgdesc="CLI for the usectl deployment platform"
arch=('x86_64' 'aarch64')
url="https://github.com/syst3mctl/usectl-cli"
license=('MIT')
depends=('glibc')
source_x86_64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('f5c8bbf9b0fff26d879043dc0822251fd52d0983f83e8a9d176d2ebd67f80308')
sha256sums_aarch64=('d0c86f528dd889d4b956679f445e647a02528f4cee10d4c8aefbc36530a51ffd')
package() {
  install -Dm755 usectl "$pkgdir/usr/bin/usectl"
}
