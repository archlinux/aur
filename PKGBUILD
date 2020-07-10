# Maintainer: Archadept
#   Revision: 2020-07-10

pkgname=ttf-labrit
_pkgname=labrit
pkgver=1
pkgrel=1
pkgdesc="A basic decorative ttf font by Apostrophic Labs"
arch=('any')
url="http://moorstation.org/typoasis/designers/lab/"
license=('Free')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-util')
install=ttf.install
source=("http://img.dafont.com/dl/?f=labrit")
md5sums=('25d12059e240c989456bf11653ca66a2')

package() {
    mkdir "$srcdir/$_pkgname"
    mv $srcdir/LABRIT__.ttf $srcdir/$_pkgname
    cd "$srcdir/$_pkgname"
    install -Dm644 "LABRIT__.ttf" "$pkgdir/usr/share/fonts/TTF/LABRIT__.ttf"
}
