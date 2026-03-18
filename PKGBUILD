# Maintainer: syst3mctl <support@usectl.com>
pkgname=usectl
pkgver=1.0.16
pkgrel=1
pkgdesc="CLI for the usectl self-hosted deployment platform"
arch=('x86_64' 'aarch64')
url="https://github.com/syst3mctl/usectl-cli"
license=('MIT')
depends=('glibc')
source_x86_64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('0e565a67a7e99521d6493e20725865eecf06519fe1ef014b5f120501de641ca5')
sha256sums_aarch64=('c101ac784419c61fc7a6f9a81e850e6d44db977ec2ed107a9ebe27127000c241')
package() {
  install -Dm755 usectl "$pkgdir/usr/bin/usectl"
}
