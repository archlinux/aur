# Maintainer: syst3mctl <support@usectl.com>
pkgname=usectl
pkgver=1.0.7
pkgrel=1
pkgdesc="CLI for the usectl self-hosted deployment platform"
arch=('x86_64' 'aarch64')
url="https://github.com/syst3mctl/usectl-cli"
license=('MIT')
depends=('glibc')
source_x86_64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('495f5f5c6a72fee9f7a2bb44eaf49812d8ded9479a400b1bd0e0df873d57b896')
sha256sums_aarch64=('3e7ab8e55f66ba205cd9796206904875e5f0154ceda360564bcf613640f29ffb')
package() {
  install -Dm755 usectl "$pkgdir/usr/bin/usectl"
}
