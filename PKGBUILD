# Maintainer: syst3mctl <support@usectl.com>
pkgname=usectl
pkgver=2.10.1
pkgrel=1
pkgdesc="CLI for the usectl deployment platform"
arch=('x86_64' 'aarch64')
url="https://github.com/syst3mctl/usectl-cli"
license=('MIT')
depends=('glibc')
source_x86_64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('2b9ca7b957543091b9c10325be01b29535cd4e1207741651b724d3b394900016')
sha256sums_aarch64=('98dddad87fea1725907df66ef3f524889a48d46bbb5f3a5c44d29744af2030d2')
package() {
  install -Dm755 usectl "$pkgdir/usr/bin/usectl"
}
