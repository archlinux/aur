# Maintainer: Tom Willemse <tom@ryuslash.org>

pkgname=chicken-xtypes
_pkgname=xtypes
pkgver=0.1a2
pkgrel=1
pkgdesc="Chicken Egg: Bindings for datatypes used by Xlib"
depends=('chicken' 'chicken-foreigners')
arch=('x86_64')
url='http://wiki.call-cc.org/eggref/4/xtypes'
license=('BSD')

build() {
    cd "$srcdir"
    chicken-install -r "${_pkgname}:${pkgver}"
}

package() {
    cd "${srcdir}/${_pkgname}"
    chicken-install -p "${pkgdir}/usr"
}
