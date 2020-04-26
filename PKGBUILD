# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=tuddesign-fonts
pkgver=1
pkgrel=1
pkgdesc='Fonts of the corporate-design from Technische Universität Darmstadt (Only available within the TUD-network!)'
arch=('any')
url='https://www.intern.tu-darmstadt.de/arbeitsmittel/corporate_design_vorlagen/index.de.jsp'
license=('custom')
source=('local://tu-darmstadt-schriften_jan08.zip')
b2sums=('888121eb59ca856e2e0662bf4d9c4bb509484b42b54957a0559a5cec63c6f067299bfec9b6d0bc226e9c2a8cc69472ec4861f6889d433b163cacf588288cefa7')

package() {
  install -dm755 "${pkgdir}"/usr/share/fonts/TTF
  install -Dm644 "${srcdir}"/darmstadt/ttf/*.ttf "${pkgdir}"/usr/share/fonts/TTF
}
