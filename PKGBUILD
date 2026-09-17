# Maintainer: syst3mctl <support@usectl.com>
pkgname=usectl
pkgver=2.3.0
pkgrel=1
pkgdesc="CLI for the usectl deployment platform"
arch=('x86_64' 'aarch64')
url="https://github.com/syst3mctl/usectl-cli"
license=('MIT')
depends=('glibc')
source_x86_64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('d436cec86cce16ac459b7b4edfe00bfe74bd11716f6073ecb2acd37e2b56e71e')
sha256sums_aarch64=('d88a3b19dbca9c719bdd7b60bd6c008f7b05f6057baab5ace333eefb210a7a07')
package() {
  install -Dm755 usectl "$pkgdir/usr/bin/usectl"
}
