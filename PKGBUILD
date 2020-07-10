# Maintainer: Archadept
#   Revision: 2020-07-10

pkgname=ttf-oldeenglish
_pkgname=oldeenglish
pkgver=1
pkgrel=1
pkgdesc="A basic decorative medieval style ttf font by Dieter Steffmann"
arch=('any')
url="http://www.steffmann.de/"
license=('Free')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-util')
install=ttf.install
source=("http://img.dafont.com/dl/?f=olde_english")
md5sums=('d62ce8bba549293855c4bee64dba3f9f')

package() {
    mkdir "$srcdir/$_pkgname"
    mv $srcdir/OldeEnglish.ttf $srcdir/$_pkgname
    cd "$srcdir/$_pkgname"
    install -Dm644 "OldeEnglish.ttf" "$pkgdir/usr/share/fonts/TTF/OldeEnglish.ttf"
}
