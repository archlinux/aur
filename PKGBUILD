# Maintainer: syst3mctl <support@usectl.com>
pkgname=usectl
pkgver=2.9.0
pkgrel=1
pkgdesc="CLI for the usectl deployment platform"
arch=('x86_64' 'aarch64')
url="https://github.com/syst3mctl/usectl-cli"
license=('MIT')
depends=('glibc')
source_x86_64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('ebeff17fa403a859fa516d7ee996f512440c1e827df9a14d80ea65f0101b08b3')
sha256sums_aarch64=('7a246df3bb37297ddea6695819e80574903c95572c77561888fb97d10242f696')
package() {
  install -Dm755 usectl "$pkgdir/usr/bin/usectl"
}
