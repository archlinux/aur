# Maintainer: syst3mctl <support@usectl.com>
pkgname=usectl
pkgver=1.0.3
pkgrel=1
pkgdesc="CLI for the usectl self-hosted deployment platform"
arch=('x86_64' 'aarch64')
url="https://github.com/syst3mctl/usectl-cli"
license=('MIT')
depends=('glibc')
source_x86_64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('b2b48c890cb86285ef6a8f4fa1fcee30c8fa6b93a5c1df2bd5019af0299e5dab')
sha256sums_aarch64=('7c14a297a4d089786ee872e8c17f0182d3429139c15dad4dbca327d66baf6c85')
package() {
  install -Dm755 usectl "$pkgdir/usr/bin/usectl"
}
