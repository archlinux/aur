# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=mikhak-fonts
pkgver=2.2
pkgrel=3
pkgdesc="simple monoline Arabic-Latin semi handwriting typeface"
url="https://aminabedi68.github.io/Mikhak/"
arch=(any)
license=('OFL')
provides=('ttf-mikhak')
conflicts=('ttf-mikhak')
source=("${pkgname}-${pkgver}.zip::https://github.com/aminabedi68/Mikhak/releases/download/v${pkgver}/Mikhak-v${pkgver}.zip"
        "LICENSE::https://raw.githubusercontent.com/aminabedi68/Mikhak/master/LICENSE")
sha256sums=('3644c198895ee200a862c48ecb2065fe867c7d382f2c8d79fcc5e4749d8c1bfd'
            'c791c42a7dafbcdf4ffa6869f195ae5bbf1f1d83f8ce5d884fe907bef875e6ea')

package() {
  install -Dt "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 ./Font/ttf/Mikhak*.ttf
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 ./LICENSE
}

