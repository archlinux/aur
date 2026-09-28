# Maintainer: Ednition <noreply@ednition.com>

pkgname=ednition-catapult
pkgver=0.25.0
pkgrel=1
pkgdesc="Catapult CLI — deploy and manage containerized apps on AWS (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://catapultapp.io"
license=('custom')
provides=('catapult')
conflicts=('catapult')
source_x86_64=("https://dl.catapultapp.io/cli/v0.25.0/catapult_0.25.0_linux_x86_64.tar.gz")
sha256sums_x86_64=('7b59a79e86e1e987a225fc9aa3439c7008929901304901019d160057390f4a94')
source_aarch64=("https://dl.catapultapp.io/cli/v0.25.0/catapult_0.25.0_linux_arm64.tar.gz")
sha256sums_aarch64=('a8dbc878d1c7abe5ebb2443a60a48c4fc8536a295d8238da1ada8215d202a7cd')

package() {
  install -Dm755 "./catapult" "${pkgdir}/usr/bin/catapult"
  install -Dm644 "./README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
