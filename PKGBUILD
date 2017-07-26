# Maintainer: William Gathoye <william + aur at gathoye dot be>
# Contributor: Tetsumaki <http://goo.gl/YMBdA>
# Contributor: rws <elisp dot vim at google mail> (@xd1le on twitter)

pkgname=sfnt2woff
pkgver=20091003
pkgrel=3
pkgdesc="Tools to convert existing TrueType/OpenType fonts to WOFF and inversely (sfnt2woff and woff2sfnt)"
arch=('i686' 'x86_64' 'armv6h')

url="https://people.mozilla.org/~jkew/woff/"
license=('MPL' 'GPL' 'LGPL')

# src.: http://superuser.com/a/429625/456258
source=('https://github.com/wget/sfnt2woff/archive/20091003.tar.gz')
sha512sums=('da6883276b5134bdd9e5e602b545cbdeab2930d0b1f39ee5b847d82f1af8d649aa84c7cb014ecd21c839547bb400da6c114b3b280e549e3553fec0949f8e4c3c')

build () {
    cd sfnt2woff-20091003
    make
}

package() {
    cd sfnt2woff-20091003/
    install -D sfnt2woff "$pkgdir/usr/bin/sfnt2woff"
    install -D woff2sfnt "$pkgdir/usr/bin/woff2sfn"
}
