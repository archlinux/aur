# Maintainer: Ednition <noreply@ednition.com>

pkgname=ednition-catapult
pkgver=0.12.1
pkgrel=1
pkgdesc="Catapult CLI — deploy and manage containerized apps on AWS (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://ednition.com"
license=('custom')
provides=('catapult')
conflicts=('catapult')
source_x86_64=("https://dl.catapult.ednition.com/cli/v0.12.1/catapult_0.12.1_linux_x86_64.tar.gz")
sha256sums_x86_64=('299d81bac8b0c66d97e2cb9fdef03c147f14d9448dce6e6aaf4ff916ac8c141f')
source_aarch64=("https://dl.catapult.ednition.com/cli/v0.12.1/catapult_0.12.1_linux_arm64.tar.gz")
sha256sums_aarch64=('8df14bab011327186b7ec6ab2dd541b60de2eabb99f9b4793dec2a7408a2ce18')

package() {
  install -Dm755 "./catapult" "${pkgdir}/usr/bin/catapult"
  install -Dm644 "./README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
