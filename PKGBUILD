# Submitter: Archadept
# Maintainer: Vinícius dos Santos Oliveira

pkgname=ttf-oldenglish5
pkgver=1
pkgrel=1
pkgdesc="A basic decorative medieval style ttf font by Dieter Steffmann"
arch=('any')
url="http://www.steffmann.de/"
license=('Free')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=ttf.install
source=("http://moorstation.org/typoasis/designers/steffmann/fonts/o/OldEnglFive.zip")
md5sums=('de5c9f9324cf28ffd614693cee6795ec')

package() {
    install -Dm644 "OldEnglishFive.ttf" "$pkgdir/usr/share/fonts/TTF/OldEnglishFive.ttf"
}
