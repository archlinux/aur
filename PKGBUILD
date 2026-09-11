# Maintainer: Ednition <noreply@ednition.com>

pkgname=ednition-catapult
pkgver=0.22.0
pkgrel=1
pkgdesc="Catapult CLI — deploy and manage containerized apps on AWS (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://catapultapp.io"
license=('custom')
provides=('catapult')
conflicts=('catapult')
source_x86_64=("https://dl.catapultapp.io/cli/v0.22.0/catapult_0.22.0_linux_x86_64.tar.gz")
sha256sums_x86_64=('e419c958db6aa607dc2bfb728dbaf04cc148344d585e3913f431102073621ca3')
source_aarch64=("https://dl.catapultapp.io/cli/v0.22.0/catapult_0.22.0_linux_arm64.tar.gz")
sha256sums_aarch64=('ca67f3dd7e20530292a92418f0e5b6f0ec42d4baefdcaaeefea533fa77847630')

package() {
  install -Dm755 "./catapult" "${pkgdir}/usr/bin/catapult"
  install -Dm644 "./README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
