# Maintainer: syst3mctl <support@usectl.com>
pkgname=usectl
pkgver=2.11.0
pkgrel=1
pkgdesc="CLI for the usectl deployment platform"
arch=('x86_64' 'aarch64')
url="https://github.com/syst3mctl/usectl-cli"
license=('MIT')
depends=('glibc')
source_x86_64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('4c431e8d8e84f8231ca3803d8b654f2feaa9d6d977f656921c48a73a47069d02')
sha256sums_aarch64=('018d9783d8fde7ef235a9f39d0b09a72ac355ad3bd80b4b5894c15fbfc04c872')
package() {
  install -Dm755 usectl "$pkgdir/usr/bin/usectl"
}
