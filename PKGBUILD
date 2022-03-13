# Maintainer: Yuannan Lin <yuannan@pm.me>

pkgname=ttf-chango
pkgver=1
pkgrel=1
pkgdesc='Chango TTF Font from Fontstage'
arch=('any')
url='https://www.1001fonts.com/users/fontstage/'
license=('custom:SIL Open Font License v1.1')
conflicts=()
source=("chango.zip::https://dl.1001fonts.com/download/chango.zip")
sha256sums=('ac73c1db32b06a615b9f7f4eba14333db19426b0363b305aba8aa5bd9bd254cb')

package() {
	install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
	install -m 644 Chango-Regular.ttf "${pkgdir}/usr/share/fonts/TTF/Chango-Regular.ttf"
	install -Dm644 OFL.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
