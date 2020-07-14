# Maintainer: Marcos Heredia <chelqo@gmail.com>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_font="lobster-font"
_group="impallari"
pkgname=ttf-${_group}-${_font}
pkgver=1.7
pkgrel=2
pkgdesc="A lovely bold condensed script font (TTF), from Pablo Impallari"
arch=(any)
url="https://github.com/impallari/The-Lobster-Font"
license=('OFL')
groups=("${_group}-fonts")
source=("${_font}-${pkgver}.zip::https://github.com/impallari/The-Lobster-Font/archive/master.zip")
sha256sums=('501ebbe8ebcadeb33d5b21786c57023236b996ed71a8900f0475e5252a996863')

package() {
  cd ${srcdir}/The-Lobster-Font-master

  install -Dpm644 fonts/ttf/*.ttf -t "${pkgdir}/usr/share/fonts/TTF/${_group}"
  install -Dpm644 OFL.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 DESCRIPTION.en_us.html README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
