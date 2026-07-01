# Maintainer: Ednition <noreply@ednition.com>

pkgname=ednition-catapult
pkgver=0.12.2
pkgrel=1
pkgdesc="Catapult CLI — deploy and manage containerized apps on AWS (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://ednition.com"
license=('custom')
provides=('catapult')
conflicts=('catapult')
source_x86_64=("https://dl.catapult.ednition.com/cli/v0.12.2/catapult_0.12.2_linux_x86_64.tar.gz")
sha256sums_x86_64=('ec4456801ee1621c293842436dc007b5600607eb54517dff62d1c370b0844d25')
source_aarch64=("https://dl.catapult.ednition.com/cli/v0.12.2/catapult_0.12.2_linux_arm64.tar.gz")
sha256sums_aarch64=('4d8bb38b82b91ae81be615c7923c7f128fe67bc003e6925f4c0a232cade8e28f')

package() {
  install -Dm755 "./catapult" "${pkgdir}/usr/bin/catapult"
  install -Dm644 "./README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
