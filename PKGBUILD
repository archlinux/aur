# Maintainer: Ednition <noreply@ednition.com>

pkgname=ednition-catapult
pkgver=0.24.0
pkgrel=1
pkgdesc="Catapult CLI — deploy and manage containerized apps on AWS (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://catapultapp.io"
license=('custom')
provides=('catapult')
conflicts=('catapult')
source_x86_64=("https://dl.catapultapp.io/cli/v0.24.0/catapult_0.24.0_linux_x86_64.tar.gz")
sha256sums_x86_64=('94f830452751c815859f09665180ea73ac036e54874718ef90d330f37a8e3981')
source_aarch64=("https://dl.catapultapp.io/cli/v0.24.0/catapult_0.24.0_linux_arm64.tar.gz")
sha256sums_aarch64=('38a4e73e6dad2ee1be77dd2f78def4cd56bc3f99c40e53198a1d4156f464709f')

package() {
  install -Dm755 "./catapult" "${pkgdir}/usr/bin/catapult"
  install -Dm644 "./README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
