# Maintainer: Archadept
#   Revision: 2020-07-10

pkgname=ttf-xirwena
_pkgname=xirwena
pkgver=1
pkgrel=1
pkgdesc="A decorative medieval style ttf font by Pia Frauss"
arch=('any')
url="http://www.pia-frauss.de/"
license=('Free for personal use')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-util')
install=ttf.install
source=("http://img.dafont.com/dl/?f=xirwena")
md5sums=('4ad89b6cd7593a050a411a94a9f99cda')

package() {
    mkdir "$srcdir/$_pkgname"
    mv $srcdir/${_pkgname}1.ttf $srcdir/$_pkgname
    cd "$srcdir/$_pkgname"
    install -Dm644 "${_pkgname}1.ttf" "$pkgdir/usr/share/fonts/TTF/${_pkgname}1.ttf"
}
