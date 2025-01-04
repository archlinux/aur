# Maintainer: Jeremy Gao <wensimehrp@gmail.com>

pkgname=ttf-chillroundm
_pkgname=ChillRoundM_v1.800
pkgver=1.800
pkgrel=1
pkgdesc='A CJK font based on Zen Maru Gothic, featuring a roundish design'
arch=('any')
url='https://github.com/Warren2060/ChillRound'
license=('OFL-1.1-RFN')
depends=('fontconfig')
source=("https://github.com/Warren2060/ChillRound/releases/download/v${pkgver}/${_pkgname}.zip")
sha256sums=('d9761b1f22cdcb2f95a8a857794d7823f1b75b35a9ebd85b023adcd3ee05153b')

package() {
  install -dm 755 "${pkgdir}/usr/share/fonts/ChillRoundM"
  install -Dm 644 *.ttf "${pkgdir}/usr/share/fonts/ChillRoundM"
  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
