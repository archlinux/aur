# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=mikhak-fonts
pkgver=2.2
pkgrel=4
pkgdesc="simple monoline Arabic-Latin semi handwriting typeface"
url="https://aminabedi68.github.io/Mikhak/"
arch=(any)
license=('OFL')
provides=('ttf-mikhak')
conflicts=('ttf-mikhak')
source=("${pkgname}-${pkgver}.zip::https://github.com/aminabedi68/Mikhak/releases/download/v${pkgver}(2)/Mikhak-v${pkgver}.2.zip"
        "LICENSE::https://raw.githubusercontent.com/aminabedi68/Mikhak/master/LICENSE")
sha256sums=('0c4577fdd5d8b0be1d724db05fef87201b0b915f284062813aa2d2423dc76353'
            'c791c42a7dafbcdf4ffa6869f195ae5bbf1f1d83f8ce5d884fe907bef875e6ea')

package() {
  install -Dt "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 ./Font/ttf/*.ttf
  install -Dt "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 ./Font/ttf/FD/*.ttf
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 ./LICENSE
}

