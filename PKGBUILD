# Maintainer: duanluan <duanluan@outlook.com>

pkgname=rebased-zh-bin
_pkgname=rebased
pkgver=1.1.15
pkgrel=1
pkgdesc='Chinese language pack for Rebased'
arch=('x86_64')
url='https://github.com/DetachHead/rebased'
license=('Apache-2.0')
depends=('rebased-bin>=1.1.15-1')
provides=('rebased-zh')
options=('!strip')
source=(
  "localization-zh.jar::https://raw.githubusercontent.com/duanluan/aur-packages/main/packages/rebased-zh-bin/assets/${pkgver}/localization-zh.jar"
)
sha256sums=(
  '5ca476d3bcb4a96cb3bbbb26e799867351bce7ccbd002460ec41e45de90f6338'
)

package() {
  install -Dm644 "${srcdir}/localization-zh.jar" "${pkgdir}/opt/${_pkgname}/plugins/localization-zh/lib/localization-zh.jar"
}
