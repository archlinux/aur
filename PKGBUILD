# Maintainer: syst3mctl <support@usectl.com>
pkgname=usectl
pkgver=1.0.0
pkgrel=1
pkgdesc="CLI for the usectl self-hosted deployment platform"
arch=('x86_64' 'aarch64')
url="https://github.com/syst3mctl/usectl-cli"
license=('MIT')
depends=('glibc')

source_x86_64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('10b8277556e774b9e059ef14dac0dc8c32a7169101bdf2b39aa8b4862129cd4b')
sha256sums_aarch64=('4fee7cc40805af7c3cafbe53b0e833ab133d130415037567df93e920411ace4f')

package() {
  install -Dm755 usectl "$pkgdir/usr/bin/usectl"
}
