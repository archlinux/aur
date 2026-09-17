# Maintainer: syst3mctl <support@usectl.com>
pkgname=usectl
pkgver=2.4.0
pkgrel=1
pkgdesc="CLI for the usectl deployment platform"
arch=('x86_64' 'aarch64')
url="https://github.com/syst3mctl/usectl-cli"
license=('MIT')
depends=('glibc')
source_x86_64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('9c79a10be29efd805feae3cbadb5ce346e73a5e8203387ed74d19989e19d612f')
sha256sums_aarch64=('b32260c7ebeb4e43c17674fbbb9c883c6ac7c0d9fe49e769a2d9cb1c445e7350')
package() {
  install -Dm755 usectl "$pkgdir/usr/bin/usectl"
}
