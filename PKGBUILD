# Maintainer: barfin
pkgname=threshold-miku-light-steam-skin
pkgver=2.4.0
pkgrel=1
pkgdesc="A Hatsune Miku Steam Theme Skin with Steam New Library Supported!(Light Version)"
arch=(any)
url="https://github.com/Jack-Myth/Threshold-Miku"
license=("unknown")
depends=(steam sssm)
source=(${url}/releases/download/v${pkgver}-Light/Threshold.Miku.Light.zip)
md5sums=('f47c5fa53234915a14d5e27d75256206')
install="${pkgname}.install"

package() {
  mkdir -p ${pkgdir}/usr/share/steam/skins
  mv ${srcdir}/Threshold\ Miku\ Light ${srcdir}/threshold-miku-light
  cp -r ${srcdir}/threshold-miku-light ${pkgdir}/usr/share/steam/skins
}

