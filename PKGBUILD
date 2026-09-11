# Maintainer: Ednition <noreply@ednition.com>

pkgname=ednition-catapult
pkgver=0.22.1
pkgrel=1
pkgdesc="Catapult CLI — deploy and manage containerized apps on AWS (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://catapultapp.io"
license=('custom')
provides=('catapult')
conflicts=('catapult')
source_x86_64=("https://dl.catapultapp.io/cli/v0.22.1/catapult_0.22.1_linux_x86_64.tar.gz")
sha256sums_x86_64=('7bad4f5423c56da67cb1c9f1a6a998e3b75d96cd8de86fbe3c69a929628342d3')
source_aarch64=("https://dl.catapultapp.io/cli/v0.22.1/catapult_0.22.1_linux_arm64.tar.gz")
sha256sums_aarch64=('99bfc058f63e732da0a9e5e78d3e0ff93669dfb2e3c6cdce754c7e980ac4cb09')

package() {
  install -Dm755 "./catapult" "${pkgdir}/usr/bin/catapult"
  install -Dm644 "./README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
