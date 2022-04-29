# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=mikhak-fonts
pkgver=3.2
pkgrel=1
pkgdesc="simple monoline Arabic-Latin semi handwriting typeface"
url="https://aminabedi68.github.io/Mikhak/"
arch=(any)
license=('OFL')
provides=('ttf-mikhak')
conflicts=('ttf-mikhak')
source=("${pkgname}-${pkgver}.zip::https://github.com/aminabedi68/Mikhak/releases/download/${pkgver}/Mikhak-v${pkgver}.zip"
        "LICENSE::https://raw.githubusercontent.com/aminabedi68/Mikhak/master/OFL.txt")
sha256sums=('5e306b69d3d9a911d74cb62a76b22f74794425a01e456211fc840e7aa2267191'
            '071f566f77f4d56b39c15c9f685bc8806b04a1a9543ad6c5f3806497996d046f')

package() {
  install -Dt "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 "${srcdir}/Mikhak-v${pkgver}/Statics/ttf/"*.ttf
  install -Dt "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 "${srcdir}/Mikhak-v${pkgver}/Statics/ttf/FD/"*.ttf
  install -Dt "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 "${srcdir}/Mikhak-v${pkgver}/Variable/"*.ttf
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 ./LICENSE
}

