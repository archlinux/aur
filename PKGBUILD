# Maintainer: Ednition <noreply@ednition.com>

pkgname=ednition-catapult
pkgver=0.12.0
pkgrel=1
pkgdesc="Catapult CLI — deploy and manage containerized apps on AWS (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://ednition.com"
license=('custom')
provides=('catapult')
conflicts=('catapult')
source_x86_64=("https://dl.catapult.ednition.com/cli/v0.12.0/catapult_0.12.0_linux_x86_64.tar.gz")
sha256sums_x86_64=('1affcd4bf4a822fcbd263478a4263ba8f5f178b722ff4beaa865b1a6e157ce10')
source_aarch64=("https://dl.catapult.ednition.com/cli/v0.12.0/catapult_0.12.0_linux_arm64.tar.gz")
sha256sums_aarch64=('def00d62cffe96b2276bdf376b23462b9c9ea5f209e5f292e9c2d8f55ceffc2b')

package() {
  install -Dm755 "./catapult" "${pkgdir}/usr/bin/catapult"
  install -Dm644 "./README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
