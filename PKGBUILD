# Maintainer: Ednition <noreply@ednition.com>

pkgname=ednition-catapult
pkgver=0.13.3
pkgrel=1
pkgdesc="Catapult CLI — deploy and manage containerized apps on AWS (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://catapultapp.io"
license=('custom')
provides=('catapult')
conflicts=('catapult')
source_x86_64=("https://dl.catapultapp.io/cli/v0.13.3/catapult_0.13.3_linux_x86_64.tar.gz")
sha256sums_x86_64=('5ed9191715becf4d3ff145e06e4122b86941215851718a2df13687ff7de0bfea')
source_aarch64=("https://dl.catapultapp.io/cli/v0.13.3/catapult_0.13.3_linux_arm64.tar.gz")
sha256sums_aarch64=('bead6e4bed3fa3e8d55d9aaf52640098c92aa10a1549e3b8c46c4be1e67f9afd')

package() {
  install -Dm755 "./catapult" "${pkgdir}/usr/bin/catapult"
  install -Dm644 "./README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
