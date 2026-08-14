# Maintainer: Ednition <noreply@ednition.com>

pkgname=ednition-catapult
pkgver=0.19.0
pkgrel=1
pkgdesc="Catapult CLI — deploy and manage containerized apps on AWS (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://catapultapp.io"
license=('custom')
provides=('catapult')
conflicts=('catapult')
source_x86_64=("https://dl.catapultapp.io/cli/v0.19.0/catapult_0.19.0_linux_x86_64.tar.gz")
sha256sums_x86_64=('bc9b51cac25fc9b0bc689fa80cc58d505c7f3a2d486f17f8ddcc4546efa50205')
source_aarch64=("https://dl.catapultapp.io/cli/v0.19.0/catapult_0.19.0_linux_arm64.tar.gz")
sha256sums_aarch64=('61c9566a118bac4b4620d079a0334b997069bf26a94bb1f1098f0ba03ffec715')

package() {
  install -Dm755 "./catapult" "${pkgdir}/usr/bin/catapult"
  install -Dm644 "./README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
