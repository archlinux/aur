# Maintainer: syst3mctl <support@usectl.com>
pkgname=usectl
pkgver=2.15.0
pkgrel=1
pkgdesc="CLI for the usectl deployment platform"
arch=('x86_64' 'aarch64')
url="https://github.com/syst3mctl/usectl-cli"
license=('MIT')
depends=('glibc')
source_x86_64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('c3898c161e1ddfddb0f6ba48891dcf999f4c198be7289b8f11cb1de5f6c3a24b')
sha256sums_aarch64=('40fb6d01d396abb761656814caf7ef308feb8661235c4b9326a78f54f487b49f')
package() {
  install -Dm755 usectl "$pkgdir/usr/bin/usectl"
}
