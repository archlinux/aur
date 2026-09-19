# Maintainer: syst3mctl <support@usectl.com>
pkgname=usectl
pkgver=2.11.1
pkgrel=1
pkgdesc="CLI for the usectl deployment platform"
arch=('x86_64' 'aarch64')
url="https://github.com/syst3mctl/usectl-cli"
license=('MIT')
depends=('glibc')
source_x86_64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('f957eb78544ae21bc63fc1472ac40511a145e3203b46bd5f660f6b7c6bb115de')
sha256sums_aarch64=('fb734fd2e6dff99584f89bd8504c5a1b4c3724ab43732ef7e69a319d36e886a4')
package() {
  install -Dm755 usectl "$pkgdir/usr/bin/usectl"
}
