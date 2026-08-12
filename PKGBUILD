# Maintainer: duanluan <duanluan@outlook.com>

pkgname=rebased-zh-bin
_pkgname=rebased
pkgver=1.1.12
pkgrel=1
pkgdesc='Chinese language pack for Rebased'
arch=('x86_64')
url='https://github.com/DetachHead/rebased'
license=('Apache-2.0')
depends=('rebased-bin>=1.1.12-1')
provides=('rebased-zh')
options=('!strip')
source=(
  "localization-zh.jar::https://raw.githubusercontent.com/duanluan/aur-packages/main/packages/rebased-zh-bin/assets/${pkgver}/localization-zh.jar"
)
sha256sums=(
  '8183a6aec71d30de7fe3fa5ec56ae31608d9dba866dbff9bdc9e60cc95878ce8'
)

package() {
  install -Dm644 "${srcdir}/localization-zh.jar" "${pkgdir}/opt/${_pkgname}/plugins/localization-zh/lib/localization-zh.jar"
}
