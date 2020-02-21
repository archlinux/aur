# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=tuddesign-fonts
pkgver=1
pkgrel=1
pkgdesc='Fonts of the corporate-design from Technische Universität Darmstadt (Only available within the TUD-network!)'
arch=('any')
url='https://www.intern.tu-darmstadt.de/arbeitsmittel/corporate_design_vorlagen/index.de.jsp'
license=('custom')
source=('local://tu-darmstadt-schriften_jan08.zip')
sha512sums=('b4f292dc387287ffd2d349cf99213900d49d420b1541fb991f3f03716b532f18344d2f81767bfef6bb99a24e8ac5560d633507c8ef2299d89aea6348a70debba')

package() {
  install -dm755 "${pkgdir}"/usr/share/fonts/TTF
  install -Dm644 "${srcdir}"/darmstadt/ttf/*.ttf "${pkgdir}"/usr/share/fonts/TTF
}
