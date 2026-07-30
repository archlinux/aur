# Maintainer: duanluan <duanluan@outlook.com>

pkgname=rebased-zh-bin
_pkgname=rebased
pkgver=1.1.9
pkgrel=1
pkgdesc='Chinese language pack for Rebased'
arch=('x86_64')
url='https://github.com/DetachHead/rebased'
license=('Apache-2.0')
depends=('rebased-bin>=1.1.9-2')
provides=('rebased-zh')
options=('!strip')
source=(
  "localization-zh.jar::https://raw.githubusercontent.com/duanluan/aur-packages/main/packages/rebased-zh-bin/assets/${pkgver}/localization-zh.jar"
)
sha256sums=(
  '4dce00b779cc31218d27338fcfe294e5ffb6338ebffbfd37dc0f31da888d5b9e'
)

package() {
  install -Dm644 "${srcdir}/localization-zh.jar" "${pkgdir}/opt/${_pkgname}/plugins/localization-zh/lib/localization-zh.jar"
}
