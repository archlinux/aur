# Maintainer: Adrià Arrufat <swiftscyhe at gmail dot com>

_pkgname=plex
pkgname=texlive-fonts-${_pkgname}
pkgver=20231217
pkgrel=1
pkgdesc="Support for IBM Plex fonts for TEX(-alike) systems"
arch=('any')
url="https://www.ctan.org/tex-archive/fonts/${_pkgname}"
license=('custom:OFL-1.1')
depends=('texlive-core')
conflicts=('texlive-fontsextra')
install="${pkgname}.install"
source=("http://mirrors.ctan.org/fonts/${_pkgname}.zip")
md5sums=('5c86dba5775b604997757cdf3a0aad66')

package() {
    install -Dm644 -t ${pkgdir}/usr/share/texmf-dist/enc/dvips/${_pkgname} ${_pkgname}/enc/*
    install -Dm644 -t ${pkgdir}/usr/share/texmf-dist/fonts/map/dvips/${_pkgname} ${_pkgname}/map/plex.map
    install -Dm644 -t ${pkgdir}/usr/share/texmf-dist/enc/opentype/${_pkgname} ${_pkgname}/opentype/*
    install -Dm644 -t ${pkgdir}/usr/share/texmf-dist/enc/tfm/ibm/${_pkgname} ${_pkgname}/tfm/*
    install -Dm644 -t ${pkgdir}/usr/share/texmf-dist/enc/type1/ibm/${_pkgname} ${_pkgname}/type1/*
    install -Dm644 -t ${pkgdir}/usr/share/texmf-dist/enc/vf/ibm/${_pkgname} ${_pkgname}/vf/*
    install -Dm644 -t ${pkgdir}/usr/share/texmf-dist/tex/latex/ibm/${_pkgname} ${_pkgname}/latex/*
    install -Dm644 -t ${pkgdir}/usr/share/licenses/${pkgname} $_pkgname/doc/LICENSE.txt
}

