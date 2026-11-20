# Maintainer: Ednition <noreply@ednition.com>

pkgname=ednition-catapult
pkgver=0.28.0
pkgrel=1
pkgdesc="Catapult CLI — deploy and manage containerized apps on AWS (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://catapultapp.io"
license=('custom')
provides=('catapult')
conflicts=('catapult')
source_x86_64=("https://dl.catapultapp.io/cli/v0.28.0/catapult_0.28.0_linux_x86_64.tar.gz")
sha256sums_x86_64=('63376d6390c473d40aea19566bae061115a5de50bd3fad50127be8876fd9df60')
source_aarch64=("https://dl.catapultapp.io/cli/v0.28.0/catapult_0.28.0_linux_arm64.tar.gz")
sha256sums_aarch64=('65ae37802805d4d58b17e298cad33aba3ee8d496a14578a6506221db46841ce8')

package() {
  install -Dm755 "./catapult" "${pkgdir}/usr/bin/catapult"
  install -Dm644 "./README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
