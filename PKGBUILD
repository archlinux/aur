# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_pkgname=linear-cli
pkgname=linear-cli-finesssee-bin
pkgver=0.3.25
pkgrel=1
pkgdesc="A powerful CLI for Linear.app built with Rust (by Finesssee) - Binary"
arch=('x86_64')
url="https://github.com/Finesssee/linear-cli"
license=('MIT')
depends=('glibc' 'gcc-libs')
provides=("linear-cli-finesssee=${pkgver}")
conflicts=('linear-cli-finesssee')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/Finesssee/linear-cli/releases/download/v${pkgver}/linear-cli-x86_64-unknown-linux-gnu.tar.gz")
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/Finesssee/linear-cli/v${pkgver}/LICENSE")

sha256sums_x86_64=('f17484b5947263aad4394d259135f36a3429a8f867c25d14984f0cd585f3ec99')
sha256sums=('06dcddbb6908a0c6dd4a9e8ec822eea41d5a460a53089fecccc8a68049e99241')

package() {
  install -Dm755 "${srcdir}/${_pkgname}" -t "${pkgdir}/usr/bin/"
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
