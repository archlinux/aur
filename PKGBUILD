# Maintainer: Valère Monseur <valere dot monseur at ymail dot com>

pkgname=ttf-c64-fonts
pkgver=1.2
pkgrel=1
pkgdesc="Set of Commodore 64 truetype fonts"
arch=('any')
url="http://style64.org/c64-truetype"
license=('custom')
depends=('xorg-fonts-encodings' 'xorg-fonts-alias' 'xorg-font-utils' 'fontconfig')
install=ttf-c64-fonts.install
source=("http://style64.org/file/C64_TrueType_v${pkgver}-STYLE.zip")
md5sums=('b4e97f5c33671a2dc88a22b16b67b232')

package() {
  cd "${srcdir}/C64_TrueType_v${pkgver}-STYLE"

  install -Dm644 fonts/C64_Pro-STYLE.ttf "${pkgdir}"/usr/share/fonts/TTF/C64_Pro-STYLE.ttf
  install -Dm644 fonts/C64_Pro_Mono-STYLE.ttf "${pkgdir}"/usr/share/fonts/TTF/C64_Pro_Mono-STYLE.ttf
  install -Dm644 license.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/license.txt
}
