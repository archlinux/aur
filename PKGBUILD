# Maintainer: Ednition <noreply@ednition.com>

pkgname=ednition-catapult
pkgver=0.26.1
pkgrel=1
pkgdesc="Catapult CLI — deploy and manage containerized apps on AWS (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://catapultapp.io"
license=('custom')
provides=('catapult')
conflicts=('catapult')
source_x86_64=("https://dl.catapultapp.io/cli/v0.26.1/catapult_0.26.1_linux_x86_64.tar.gz")
sha256sums_x86_64=('e42c481e18ebca8896efef895d91996dfe1ac3c8ebf847d664d9196bf32cc13d')
source_aarch64=("https://dl.catapultapp.io/cli/v0.26.1/catapult_0.26.1_linux_arm64.tar.gz")
sha256sums_aarch64=('4f1dd1c749067615b0e1c7154a61e6228fd07da4bc513eb53938d577333b6454')

package() {
  install -Dm755 "./catapult" "${pkgdir}/usr/bin/catapult"
  install -Dm644 "./README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
