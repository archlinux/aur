# Maintainer: Ednition <noreply@ednition.com>

pkgname=ednition-catapult
pkgver=0.16.0
pkgrel=1
pkgdesc="Catapult CLI — deploy and manage containerized apps on AWS (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://catapultapp.io"
license=('custom')
provides=('catapult')
conflicts=('catapult')
source_x86_64=("https://dl.catapultapp.io/cli/v0.16.0/catapult_0.16.0_linux_x86_64.tar.gz")
sha256sums_x86_64=('070366d8fb6ba3a8733be37eeaef66c117f1703ee02fdafe5991eee7ea4cd98d')
source_aarch64=("https://dl.catapultapp.io/cli/v0.16.0/catapult_0.16.0_linux_arm64.tar.gz")
sha256sums_aarch64=('672c9b9b8935ba7aeee698447e49347e9da50932193279917025c8a6a976e60b')

package() {
  install -Dm755 "./catapult" "${pkgdir}/usr/bin/catapult"
  install -Dm644 "./README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
