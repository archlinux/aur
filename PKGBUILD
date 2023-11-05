# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>
# Co-Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgbase=estedad-fonts
pkgname=("ttf-estedad" "ttf-estedad-variable"
         "woff2-estedad" "woff2-estedad-variable")
pkgver=7.3
pkgrel=1
pkgdesc="A Sans Serif Arabic-Latin text typeface"
url="https://github.com/aminabedi68/Estedad"
arch=(any)
license=('OFL')
groups=("${pkgbase}" "persian-fonts")
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/Estedad-v${pkgver}.zip"
        "${pkgbase}-LICENSE::${url}/raw/master/OFL.txt")

sha256sums=('a15726ac8b78b7d87f8b10fbc26581ef309f2c6a8a26f547d90b33d75c73cb87'
            'b0672e6521cd32ca77db2127e23c134719efb0e5d0cf11c2dfc2b23d05b365ce')

package_ttf-estedad() {
  pkgdesc="${pkgdesc} (TTF)."

  cd "${srcdir}/Estedad-v${pkgver}"
  install -Dt "${pkgdir}/usr/share/fonts/TTF" -m644 ttf/*.ttf
  install -Dt "${pkgdir}/usr/share/fonts/TTF" -m644 ttf/FD/*.ttf
  install -D -m644 ${srcdir}/${pkgbase}-LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_ttf-estedad-variable() {
  pkgdesc="${pkgdesc} (TTF Variable)."

  cd "${srcdir}/Estedad-v${pkgver}"
  install -Dt "${pkgdir}/usr/share/fonts/TTF" -m644 Variable/*.ttf
  install -D -m644 ${srcdir}/${pkgbase}-LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_woff2-estedad() {
  pkgdesc="${pkgdesc} (WOFF2)."

  cd "${srcdir}/Estedad-v${pkgver}"
  install -Dt "${pkgdir}/usr/share/fonts/WOFF2" -m644 webfonts/statics/*.woff2
  install -Dt "${pkgdir}/usr/share/fonts/WOFF2" -m644 webfonts/statics/FD/*.woff2
  install -D -m644 ${srcdir}/${pkgbase}-LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_woff2-estedad-variable() {
  pkgdesc="${pkgdesc} (WOFF2 Variable)."

  cd "${srcdir}/Estedad-v${pkgver}"
  install -Dt "${pkgdir}/usr/share/fonts/WOFF2" -m644 webfonts/variable/*.woff2
  install -D -m644 ${srcdir}/${pkgbase}-LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=4 sw=4 et:
