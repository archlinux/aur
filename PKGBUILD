# Maintainer: Adrian Lew <adrian.lewtx at gmail dot com>
pkgname=spicetify-theme-dribbblish-dynamic
pkgver=3.1.1
pkgrel=1
pkgdesc="A mod of Dribbblish theme for Spicetify with support for light/dark modes and album art based colors."
arch=('any')
url="https://github.com/JulienMaille/dribbblish-dynamic-theme"
license=('custom')
depends=(spicetify-cli)
install="${pkgname}.install"
source=("https://github.com/JulienMaille/dribbblish-dynamic-theme/releases/download/${pkgver}/DribbblishDynamic_v${pkgver}.zip")
md5sums=('1a68c271cdffc4b462d489ae1e2a221c')

package() {
  mkdir -p "${pkgdir}/usr/share/spicetify-cli/Themes/"
  mkdir -p "${pkgdir}/usr/share/spicetify-cli/Extensions/"
	cp -r "${srcdir}" "${pkgdir}/usr/share/spicetify-cli/Themes/"
	cp "${srcdir}/dribbblish-dynamic.js" "${pkgdir}/usr/share/spicetify-cli/Extensions/"
}
