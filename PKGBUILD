# Maintainer: syst3mctl <support@usectl.com>
pkgname=usectl
pkgver=2.16.1
pkgrel=1
pkgdesc="CLI for the usectl deployment platform"
arch=('x86_64' 'aarch64')
url="https://github.com/syst3mctl/usectl-cli"
license=('MIT')
depends=('glibc')
source_x86_64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('b3fd7db0eba76462ead0c856359e4f94754216dd291be1dc41b1ebc0a19f031d')
sha256sums_aarch64=('773ee4fba3a961d1280ae576006f6902d6aee3a5afd2a5c84a8dd54442a00c85')
package() {
  install -Dm755 usectl "$pkgdir/usr/bin/usectl"
}
