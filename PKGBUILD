# Maintainer: Ednition <noreply@ednition.com>

pkgname=ednition-catapult
pkgver=0.10.0
pkgrel=1
pkgdesc="Catapult CLI — deploy and manage containerized apps on AWS (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://ednition.com"
license=('custom')
provides=('catapult')
conflicts=('catapult')
source_x86_64=("https://dl.catapult.ednition.com/cli/v0.10.0/catapult_0.10.0_linux_x86_64.tar.gz")
sha256sums_x86_64=('35a80074d09fd45a8f177ccb536f6053892cb0fd0c8ace13a027e19b8ce32eb7')
source_aarch64=("https://dl.catapult.ednition.com/cli/v0.10.0/catapult_0.10.0_linux_arm64.tar.gz")
sha256sums_aarch64=('c4818658561a4102d8d64fa4dc7fcea31fc6f53dfd730a1cdb19f2f51cf9c2fb')

package() {
  install -Dm755 "./catapult" "${pkgdir}/usr/bin/catapult"
  install -Dm644 "./README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
