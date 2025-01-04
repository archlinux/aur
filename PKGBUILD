# Maintainer: Jeremy Gao <wensimehrp@gmail.com>
# Contributor: maoyaotang <292898660@qq.com>

pkgname=ttf-chillroundf
_pkgname=ChillRoundF_v3.200
pkgver=v3.200
pkgrel=2
pkgdesc='A CJK font based on Kosugi Maru and its derivatives, featuring a roundish design'
arch=('any')
url='https://github.com/Warren2060/ChillRound'
license=('OFL-1.1-RFN')
depends=('fontconfig')
source=("https://github.com/Warren2060/ChillRound/releases/download/${pkgver}/${_pkgname}.zip")
sha256sums=('7a061e39cc8f377ce122f0ae68d1fe3ef43d78431388362c61ea8d695722d267')

package() {
  cd "${_pkgname}"
  install -dm 755 "${pkgdir}/usr/share/fonts/ChillRoundF"
  install -Dm 644 *.ttf "${pkgdir}/usr/share/fonts/ChillRoundF"
  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
