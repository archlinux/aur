# Maintainer: syst3mctl <support@usectl.com>
pkgname=usectl
pkgver=1.1.1
pkgrel=1
pkgdesc="CLI for the usectl self-hosted deployment platform"
arch=('x86_64' 'aarch64')
url="https://github.com/syst3mctl/usectl-cli"
license=('MIT')
depends=('glibc')
source_x86_64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('c0b329ed3ee531380b94dd496364b0c6948910576f9f69bdd6080566c2f23fbd')
sha256sums_aarch64=('a4a4345c2f09d213522e8f207660f49824c0b0abda298c94b1de4f11ad9b2ac6')
package() {
  install -Dm755 usectl "$pkgdir/usr/bin/usectl"
}
