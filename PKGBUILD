# Maintainer: Sebastian Wolf <fatmike303 at gmail dot com>
pkgname=ttf-c64
pkgver=1.2
pkgrel=1
pkgdesc="The best available C64 TrueType representation to date"
arch=('any')
url="http://style64.org/c64-truetype"
license=('http://style64.org/c64-truetype/license')
depends=('fontconfig' 'xorg-font-utils')
source=(http://style64.org/file/C64_TrueType_v${pkgver}-STYLE.zip)
install=$pkgname.install
md5sums=('b4e97f5c33671a2dc88a22b16b67b232')

package() {
#	mkdir -p $pkgdir/usr/share/fonts/TTF
	install -D -m644 "${srcdir}/C64_TrueType_v$pkgver-STYLE/fonts/C64_Pro_Mono-STYLE.ttf" "${pkgdir}/usr/share/fonts/TTF/c64_pro_mono.ttf" || return 1
	install -D -m644 "${srcdir}/C64_TrueType_v$pkgver-STYLE/fonts/C64_Pro-STYLE.ttf" "${pkgdir}/usr/share/fonts/TTF/c64_pro.ttf" || return 1
	install -D -m644 $srcdir/C64_TrueType_v$pkgver-STYLE/license.txt "${pkgdir}/usr/share/licenses/ttf-c64/LICENSE" || return 1
}
