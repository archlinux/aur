# Maintainer: syst3mctl <support@usectl.com>
pkgname=usectl
pkgver=2.4.1
pkgrel=1
pkgdesc="CLI for the usectl deployment platform"
arch=('x86_64' 'aarch64')
url="https://github.com/syst3mctl/usectl-cli"
license=('MIT')
depends=('glibc')
source_x86_64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('88ce26b43a6129ca439ae88def21c147eb9fc7546dd73ad0644d566561f9936c')
sha256sums_aarch64=('01e96550d722a6c92a167033b4026e5de9028a11990b31ff7a987040d5a2b2f8')
package() {
  install -Dm755 usectl "$pkgdir/usr/bin/usectl"
}
