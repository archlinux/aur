# Maintainer: Valère Monseur <archlinux at vale dot re>

pkgname=ttf-c64-fonts
pkgver=1.2.1
pkgrel=1
pkgdesc="Set of Commodore 64 truetype fonts"
arch=('any')
url="http://style64.org/c64-truetype"
license=('custom')
source=("https://style64.org/file/C64_TrueType_v${pkgver}-STYLE.zip")
md5sums=('11079447b3105ce8ad1b855c1075034a')

package() {
  cd "${srcdir}/C64_TrueType_v${pkgver}-STYLE"

  install -Dm644 fonts/C64_Pro-STYLE.ttf "${pkgdir}"/usr/share/fonts/TTF/C64_Pro-STYLE.ttf
  install -Dm644 fonts/C64_Pro_Mono-STYLE.ttf "${pkgdir}"/usr/share/fonts/TTF/C64_Pro_Mono-STYLE.ttf
  install -Dm644 license.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/license.txt
}
