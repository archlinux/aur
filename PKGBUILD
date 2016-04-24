# Maintainer: Popkornium18 <mail@popkornium18.de>

pkgname=ttf-babel-sans
pkgver=20160423
pkgrel=1
pkgdesc="Babel Sans TrueType Font"
arch=(any)
url="http://manfred-klein.ina-mar.com/"
license=('custom')
depends=(fontconfig xorg-font-utils)
source=('http://moorstation.org/typoasis/designers/klein03/text02/pc/Babel.zip'
        'LICENSE')
install=$pkgname.install
sha256sums=('c732b7522031516f15af6242f0e63d79197050eb9970f7280c9199214d14ee35'
            '0b371bda434a543dfdb517c79d9b5eaef03a989c4004b60573e7abd05553afa4')

package() {
  install -Dm644 ${srcdir}/BabelSans.ttf "$pkgdir"/usr/share/fonts/TTF/BabelSans.ttf
  install -Dm644 ${srcdir}/BabelSans-Bold.ttf "$pkgdir"/usr/share/fonts/TTF/BabelSans-Bold.ttf
  install -Dm644 ${srcdir}/BabelSans-BoldOblique.ttf "$pkgdir"/usr/share/fonts/TTF/BabelSans-BoldOblique.ttf
  install -Dm644 ${srcdir}/BabelSans-Oblique.ttf "$pkgdir"/usr/share/fonts/TTF/BabelSans-Oblique.ttf
  install -Dm644 ${srcdir}/LICENSE "$pkgdir"/usr/share/licenses/ttf-babel-sans/LICENSE
}
