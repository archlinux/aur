# Maintainer: Archadept
#   Revision: 2020-07-10

pkgname=ttf-goodcity
_pkgname=goodcity
pkgver=1
pkgrel=1
pkgdesc="A basic decorative medieval style ttf font by A. S. Meit"
arch=('any')
url="http://www.dafont.com/good-city-modern.font"
license=('Uknown proprietary')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-util')
install=ttf.install
source=("http://img.dafont.com/dl/?f=good_city_modern")
md5sums=('0aaf829370590d41791b5d6ce0c784cd')

package() {
    mkdir "$srcdir/$_pkgname"
    mv $srcdir/gocmp___.ttf $srcdir/$_pkgname
    cd "$srcdir/$_pkgname"
    install -Dm644 "gocmp___.ttf" "$pkgdir/usr/share/fonts/TTF/gocmp___.ttf"
}
