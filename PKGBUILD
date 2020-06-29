# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Firmicus <francois.archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=ttf-ubraille
pkgver=001.000
pkgrel=11
pkgdesc='Unicode Braillt font'
url='https://yudit.org/download/fonts/UBraille/'
arch=('any')
license=('GPL')
source=('https://yudit.org/download/fonts/UBraille/UBraille.ttf')
b2sums=('52f166a79116d4279ba53cc4dbcaac30044cead800b62dca009a8ea630f788612215cc31af80bac36a6fda39e704caf8364e63432e5eac034f2f3504f0e45131')

package() {
  install -Dm644 -t "${pkgdir}"/usr/share/fonts/TTF/ *.ttf
}
