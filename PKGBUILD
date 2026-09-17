# Maintainer: syst3mctl <support@usectl.com>
pkgname=usectl
pkgver=2.5.0
pkgrel=1
pkgdesc="CLI for the usectl deployment platform"
arch=('x86_64' 'aarch64')
url="https://github.com/syst3mctl/usectl-cli"
license=('MIT')
depends=('glibc')
source_x86_64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('89fe2a9c6871ae2ae48af05339061db1031629e97ff75d155f3fb457cd1cc406')
sha256sums_aarch64=('382688660e2f22a2a7b48ff1ee60e65d134eb2b557d0c10142bd1bf340321dc2')
package() {
  install -Dm755 usectl "$pkgdir/usr/bin/usectl"
}
