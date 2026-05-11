# Maintainer: syst3mctl <support@usectl.com>
pkgname=usectl
pkgver=1.1.3
pkgrel=1
pkgdesc="CLI for the usectl deployment platform"
arch=('x86_64' 'aarch64')
url="https://github.com/syst3mctl/usectl-cli"
license=('MIT')
depends=('glibc')
source_x86_64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('0eee823521e56ebbf04e1708ac8d6d78456a7a3ffca5b5fd1e2a936fcb54b358')
sha256sums_aarch64=('3d7a0bda95684859d1ad373895feec8a956e52fa78ac58d29d5c083a4e9eac12')
package() {
  install -Dm755 usectl "$pkgdir/usr/bin/usectl"
}
