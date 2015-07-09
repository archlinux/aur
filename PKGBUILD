# Maintainer: Tom Willemse <tom@ryuslash.org>

pkgname=chicken-xft
_pkgname=xft
pkgver=0.1
pkgrel=1
pkgdesc="Chicken Egg: Bindings for xft"
depends=('chicken' 'chicken-foreigners' 'chicken-xtypes')
arch=('x86_64')
url='http://wiki.call-cc.org/eggref/4/xft'
license=('BSD')

build() {
    cd "$srcdir"
    chicken-install -r "${_pkgname}:${pkgver}"
}

package() {
    cd "${srcdir}/${_pkgname}"
    chicken-install -p "${pkgdir}/usr"
}
