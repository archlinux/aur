# Maintainer: syst3mctl <support@usectl.com>
pkgname=usectl
pkgver=1.0.9
pkgrel=1
pkgdesc="CLI for the usectl self-hosted deployment platform"
arch=('x86_64' 'aarch64')
url="https://github.com/syst3mctl/usectl-cli"
license=('MIT')
depends=('glibc')
source_x86_64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('8af3e42f46d4cf64e41caeacbf4d21b1c38db5449537400fbae52776229a77a7')
sha256sums_aarch64=('4519c1460654f9836e15be0e8683ccc740482e2fea2fd4ba026d2a1f4e90d1b9')
package() {
  install -Dm755 usectl "$pkgdir/usr/bin/usectl"
}
