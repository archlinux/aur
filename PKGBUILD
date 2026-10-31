# Maintainer: duanluan <duanluan@outlook.com>

pkgname=rebased-zh-bin
_pkgname=rebased
pkgver=1.1.23
pkgrel=1
pkgdesc='Chinese language pack for Rebased'
arch=('x86_64')
url='https://github.com/DetachHead/rebased'
license=('Apache-2.0')
depends=('rebased-bin>=1.1.23-1')
provides=('rebased-zh')
options=('!strip')
source=(
  "localization-zh.jar::https://raw.githubusercontent.com/duanluan/aur-packages/main/packages/rebased-zh-bin/assets/${pkgver}/localization-zh.jar"
)
sha256sums=(
  'bd916d328d7fe99ed1f52cd5cdb462ce9ba0cfef7e8378721bef3c9bc6b88ca4'
)

package() {
  install -Dm644 "${srcdir}/localization-zh.jar" "${pkgdir}/opt/${_pkgname}/plugins/localization-zh/lib/localization-zh.jar"
}
