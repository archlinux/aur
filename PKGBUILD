# Maintainer: Ednition <noreply@ednition.com>

pkgname=ednition-catapult
pkgver=0.11.0
pkgrel=1
pkgdesc="Catapult CLI — deploy and manage containerized apps on AWS (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://ednition.com"
license=('custom')
provides=('catapult')
conflicts=('catapult')
source_x86_64=("https://dl.catapult.ednition.com/cli/v0.11.0/catapult_0.11.0_linux_x86_64.tar.gz")
sha256sums_x86_64=('0b9b31972bbb364f8219ee6ecdf2cfe58d8bbb2a603a7bfd4f8472549f90e72e')
source_aarch64=("https://dl.catapult.ednition.com/cli/v0.11.0/catapult_0.11.0_linux_arm64.tar.gz")
sha256sums_aarch64=('7022234ffb98ef58ed391cd1c8f8fa16f48a857b1979c7e6a58cb029c6ae87c3')

package() {
  install -Dm755 "./catapult" "${pkgdir}/usr/bin/catapult"
  install -Dm644 "./README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
