# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=ttf-quitemagical
pkgver=1.0
pkgrel=1
pkgdesc="A handwritten font by Misti's Fonts (freeware)"
arch=(any)
url="https://mistifonts.com/quite-magical"
license=()
source=("https://mistifonts.com/fonts/quite-magical.zip")
sha512sums=('a3c342ee2d220b0c416f366cfa9b38ea7f9ec57c47a01fb50f33a4860604ea6dee5f478c73fda85e0a1a84cad591d96a1c8c31c8415b18c2a75e3f7cd57b95fb')

package() {
    cd $srcdir
    install -dm 755		${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 	${srcdir}/'Quite Magical - TTF.ttf' ${pkgdir}/usr/share/fonts/TTF/QuiteMagical.ttf
    install -D -m644 	${srcdir}/'Quite Magical - Terms Of Use.url' ${pkgdir}/usr/share/licenses/${pkgname}/QuiteMagical_Terms-Of-Use.txt
}
