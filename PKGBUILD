# Maintainer: Adrian Lew <adrian.lewtx at gmail dot com>
pkgname=spicetify-theme-dribbblish-dynamic
pkgver=4.2.1
pkgrel=1
pkgdesc="A mod of Dribbblish theme for Spicetify with support for light/dark modes and album art based colors."
arch=('any')
url="https://github.com/JulienMaille/dribbblish-dynamic-theme"
license=('custom')
depends=(spicetify-cli)
install="${pkgname}.install"
source=("https://github.com/JulienMaille/dribbblish-dynamic-theme/releases/download/${pkgver}/DribbblishDynamic_v${pkgver}.zip")
md5sums=('111106abe24a1d3e772a997331cbe1f1')

package() {
  mkdir -p "${pkgdir}/usr/share/spicetify-cli/Themes/DribbblishDynamic"
  mkdir -p "${pkgdir}/usr/share/spicetify-cli/Extensions/"
	cp -r -T "${srcdir}" "${pkgdir}/usr/share/spicetify-cli/Themes/DribbblishDynamic"
	cp "${srcdir}/dribbblish-dynamic.js" "${pkgdir}/usr/share/spicetify-cli/Extensions/"
}
