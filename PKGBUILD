# Maintainer: duanluan <duanluan@outlook.com>

pkgname=rebased-zh-bin
_pkgname=rebased
pkgver=1.1.7
pkgrel=1
pkgdesc='Chinese language pack for Rebased'
arch=('x86_64')
url='https://github.com/DetachHead/rebased'
license=('Apache-2.0')
depends=('rebased-bin>=1.1.7-1')
provides=('rebased-zh')
options=('!strip')
source=(
  "localization-zh.jar::https://raw.githubusercontent.com/duanluan/aur-packages/main/packages/rebased-zh-bin/assets/${pkgver}/localization-zh.jar"
)
sha256sums=(
  '342e9bc6107044cff116a04834551d551c1b3d6c08bf121fdc7348170fc99a65'
)

package() {
  install -Dm644 "${srcdir}/localization-zh.jar" "${pkgdir}/opt/${_pkgname}/plugins/localization-zh/lib/localization-zh.jar"
}
