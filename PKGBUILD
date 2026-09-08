# Maintainer: Ednition <noreply@ednition.com>

pkgname=ednition-catapult
pkgver=0.21.0
pkgrel=1
pkgdesc="Catapult CLI — deploy and manage containerized apps on AWS (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://catapultapp.io"
license=('custom')
provides=('catapult')
conflicts=('catapult')
source_x86_64=("https://dl.catapultapp.io/cli/v0.21.0/catapult_0.21.0_linux_x86_64.tar.gz")
sha256sums_x86_64=('dc21ca1b649930b78c209479e3fa40c6e962ed6e617acbe0148061b7b1aea5bf')
source_aarch64=("https://dl.catapultapp.io/cli/v0.21.0/catapult_0.21.0_linux_arm64.tar.gz")
sha256sums_aarch64=('ee64e5f7a820b1a282573a3d9d1e61014102bfe30218caa5b159271d0a6ec3a8')

package() {
  install -Dm755 "./catapult" "${pkgdir}/usr/bin/catapult"
  install -Dm644 "./README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
