# Maintainer: Olivier Michaelis <michaelis.olivier [at] gmail [dot] com>

pkgname=spacectl-bin
pkgver=0.9.1
pkgrel=1
pkgdesc="Spacelift client and CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/spacelift-io/spacectl"
license=('MIT')
source_x86_64=(spacectl-x86_64::https://github.com/spacelift-io/spacectl/releases/download/v${pkgver}/spacectl_${pkgver}_linux_amd64.zip)
source_aarch64=(spacectl-aarch64::https://github.com/spacelift-io/spacectl/releases/download/v${pkgver}/spacectl_${pkgver}_linux_arm64.zip)
md5sums_x86_64=('9d71b07607c9f4a088e979383c5dca2a')
md5sums_aarch64=('2cbc5d7b67226788aa78e661817cefc1')

package() {
  unzip -o spacectl-${arch} spacectl
  install -Dm755 spacectl "$pkgdir/usr/bin/spacectl"
}
