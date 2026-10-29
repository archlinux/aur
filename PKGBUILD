# Maintainer: darkmagicsauce <caitlyn dot williams at proton dot me>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=("otf-colorsym")
pkgver=1.0.0
pkgrel=1
pkgdesc="An open-source symbol font that makes colors instantly identifiable by shape. Designed for color-blind accessibility"
arch=(any)
url="https://colorsym.com"
license=('CC-BY-SA-4.0 AND OFL-1.1-RFN')
groups=('fonts')
provides=("colorsym-font")

source=("colorsym-${pkgver}.zip::https://github.com/luisfrancisco/colorsym/releases/download/v1.0.0/colorsym-v1.0.0.zip")

sha256sums=('171ab11595986584d07d8dffa30185b3b564526dbf30cf4f728c72ca6faf47f0')

package() {
	install -v -Dm0644 -t "${pkgdir}/usr/share/fonts/${pkgname}/" "${srcdir}/colorsym-v${pkgver}/font"/*.otf
	install -v -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "${srcdir}/colorsym-v${pkgver}"/LICENSE*.txt
}
