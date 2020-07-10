# Maintainer: Archadept
#   Revision: 2020-07-10

pkgname=ttf-germanica
_pkgname=germanica
pkgver=1
pkgrel=1
pkgdesc="A basic decorative medieval style ttf font family by Paul Lloyd"
arch=('any')
url="http://moorstation.org/typoasis/designers/lloyd/"
license=('Free')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-util')
install=ttf.install
source=("http://img.dafont.com/dl/?f=germanica_family")
md5sums=('2f67c636510e535c41f550b03cdf068a')

package() {
    mkdir "$srcdir/$_pkgname"
    mv "$srcdir/Plain Germanica.ttf" "$srcdir/$_pkgname"
    mv "$srcdir/Fluted Germanica.ttf" "$srcdir/$_pkgname"
    mv "$srcdir/Embossed Germanica.ttf" "$srcdir/$_pkgname"
    mv "$srcdir/Shadowed Germanica.ttf" "$srcdir/$_pkgname"
    cd "$srcdir/$_pkgname"
    install -Dm644 "Plain Germanica.ttf" "$pkgdir/usr/share/fonts/TTF/Plain Germanica.ttf"
    install -Dm644 "Fluted Germanica.ttf" "$pkgdir/usr/share/fonts/TTF/Fluted Germanica.ttf"
    install -Dm644 "Embossed Germanica.ttf" "$pkgdir/usr/share/fonts/TTF/Embossed Germanica.ttf"
    install -Dm644 "Shadowed Germanica.ttf" "$pkgdir/usr/share/fonts/TTF/Shadowed Germanica.ttf"
}
