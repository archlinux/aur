# Maintainer: Jeremy Gao <wensimehrp@gmail.com>

pkgname=ttf-chillduansans
_pkgname=ChillDuanSans.v1.30
pkgver=1.30
pkgrel=1
pkgdesc='A CJK sans-serif font with more variety based on Source Han Sans'
arch=('any')
url='https://github.com/Warren2060/ChillDuanSans'
license=('OFL-1.1-RFN')
depends=('fontconfig')
source=("https://github.com/Warren2060/ChillDuanSans/releases/download/v${pkgver}/${_pkgname}.zip")
sha256sums=('68471063e71f1ffa4d676bfc283ae2e60e328aa29c2bcb52f7da78f52f2adddd')

package() {
  cd "ChillDuanSans v1.3"
  install -dm 755 "${pkgdir}/usr/share/fonts/ChillDuanSans"
  install -Dm 644 *.ttf "${pkgdir}/usr/share/fonts/ChillDuanSans"
  install -Dm 644 License.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
