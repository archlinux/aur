# Maintainer: Ednition <noreply@ednition.com>

pkgname=ednition-catapult
pkgver=0.23.0
pkgrel=1
pkgdesc="Catapult CLI — deploy and manage containerized apps on AWS (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://catapultapp.io"
license=('custom')
provides=('catapult')
conflicts=('catapult')
source_x86_64=("https://dl.catapultapp.io/cli/v0.23.0/catapult_0.23.0_linux_x86_64.tar.gz")
sha256sums_x86_64=('c60119b456428e5881d628c91665a8f0690d5bd5db5353a3772867c09d2ad20f')
source_aarch64=("https://dl.catapultapp.io/cli/v0.23.0/catapult_0.23.0_linux_arm64.tar.gz")
sha256sums_aarch64=('e95fbde2db9c74b0aa87d1d1776d0579e7b8c0a9a291c9be6df310cb236692a7')

package() {
  install -Dm755 "./catapult" "${pkgdir}/usr/bin/catapult"
  install -Dm644 "./README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
