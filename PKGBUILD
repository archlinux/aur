# Maintainer: syst3mctl <support@usectl.com>
pkgname=usectl
pkgver=1.0.8
pkgrel=1
pkgdesc="CLI for the usectl self-hosted deployment platform"
arch=('x86_64' 'aarch64')
url="https://github.com/syst3mctl/usectl-cli"
license=('MIT')
depends=('glibc')
source_x86_64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('0af323f8502f7f9ddcc47d43186960f733ea92edd9bfe8e3aabf147f9c8f943a')
sha256sums_aarch64=('69eadaf24faf37e0998e96f66dc9efab51303179a38aea4a7e5f638bc355875a')
package() {
  install -Dm755 usectl "$pkgdir/usr/bin/usectl"
}
