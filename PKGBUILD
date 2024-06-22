# Maintainer: Xuanrui Qi <me@xuanruiqi.com>
# Contributor: Wayne Hartmann (DH4) <wayne@bitstorm.pw>

pkgname=ttf-wps-fonts
pkgver=2.0
pkgrel=1
pkgdesc="Symbol fonts required by wps-office."
arch=(any)
license=("custom:EULA")
depends=()
makedepends=()
url="https://github.com/ferion11/ttf-wps-fonts"
source=("$pkgname.tar.gz::https://github.com/ferion11/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
        "license.txt")
sha1sums=('fb270373c3bbea55ee80b56dd27de9f87f79607e'
          '6134a63d775540588ce48884e8cdc47d4a9a62f3')

package() {
  install -d "${pkgdir}/usr/share/fonts/wps-fonts"
  install -m644 ${srcdir}/${pkgname}-${pkgver}/*.ttf "${pkgdir}/usr/share/fonts/wps-fonts/"
  install -Dm644 "${srcdir}/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
