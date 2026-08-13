# Maintainer: Ednition <noreply@ednition.com>

pkgname=ednition-catapult
pkgver=0.18.0
pkgrel=1
pkgdesc="Catapult CLI — deploy and manage containerized apps on AWS (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://catapultapp.io"
license=('custom')
provides=('catapult')
conflicts=('catapult')
source_x86_64=("https://dl.catapultapp.io/cli/v0.18.0/catapult_0.18.0_linux_x86_64.tar.gz")
sha256sums_x86_64=('3fe4483080b6a53c48650e5a0e9e17c42998c9d0efef1a22f1a938644c5c50de')
source_aarch64=("https://dl.catapultapp.io/cli/v0.18.0/catapult_0.18.0_linux_arm64.tar.gz")
sha256sums_aarch64=('478f3227581064f33d00590a26633f4d60ba51f2a200b6291aa9261603f3e8ed')

package() {
  install -Dm755 "./catapult" "${pkgdir}/usr/bin/catapult"
  install -Dm644 "./README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
