# Maintainer: Archadept
#   Revision: 2013-10-18

pkgname=ttf-neverwinter
_pkgname=Neverwinter
pkgver=1
pkgrel=2
pkgdesc="A basic decorative ttf font by Neale Davidson based on the logo of the popular Neverwinter Nights computer game from Bioware (and has since become the official font!)"
arch=('any')
url="http://www.pixelsagas.com/"
license=('Free')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=ttf.install
source=("http://img.dafont.com/dl/?f=neverwinter")
md5sums=('e16bc6d0cceb700d42bfafdc6ebed0a2')

package() {
    mkdir "$srcdir/$_pkgname"
    mv $srcdir/$_pkgname.ttf $srcdir/$_pkgname
    cd "$srcdir/$_pkgname"
    install -Dm644 "$_pkgname.ttf" "$pkgdir/usr/share/fonts/TTF/$_pkgname.ttf"
}
