# Maintainer:  VirtualTam <virtualtam@flibidi.net>
# Contributor: wido <widomaker2k7@gmail.com>:
pkgname=fortune-mod-montypython
pkgver=20140622
pkgrel=1
pkgdesc="Fortune cookies: Monty Python and the Holy Grail."
url="http://www.sacred-texts.com/neu/mphg/mphg.htm"
arch=('any')
license=('custom:PublicDomain')
depends=('fortune-mod')
source=('montypython')
sha256sums=('f884fa7dca1691cd7e55ce40795a34b05cb1f98e1b0c63bb00da00c78d7fd070')

build() {
    strfile ${srcdir}/montypython
}

package(){
    install -D -m644 ${srcdir}/montypython ${pkgdir}/usr/share/fortune/montypython
    install -D -m644 ${srcdir}/montypython.dat ${pkgdir}/usr/share/fortune/montypython.dat
}
