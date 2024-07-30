# Maintainer: maoyaotang <292898660@qq.com>

pkgname=ttf-chillroundf
_pkgname=ChillRoundF_v3.200
pkgver=v3.200
pkgrel=1
pkgdesc='寒蝉全圆体'
arch=('any')
url='https://github.com/Warren2060/ChillRound'
license=('SIL-1.1')
depends=('git')
source=(https://github.com/Warren2060/ChillRound/releases/download/${pkgver}/${_pkgname}.zip)
sha256sums=('7a061e39cc8f377ce122f0ae68d1fe3ef43d78431388362c61ea8d695722d267')

package() {
  cd "${_pkgname}"
  rm -r *.otf ChillRoundF_Update.pdf
  install -dm 755 "${pkgdir}/usr/share/fonts/ChillRoundF"
  install -Dm644 *.ttf "${pkgdir}/usr/share/fonts/ChillRoundF"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
