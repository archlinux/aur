# $Id$
# Maintainer : Nicolas Perrin <booloki@lokizone.net>

pkgname=omdb-cli
pkgver=2.4.1
pkgrel=1
pkgdesc="Command line tool for retrieving OMDb movie informations (mandatory API key)"
arch=(any)
license=('(L)GPL3')
url="https://github.com/bgr/omdb-cli"
replaces=('imdb-cli')
source=(https://github.com/bgr/${pkgname}/archive/v${pkgver}.tar.gz)
md5sums=('4e6d1d0374999c28096ebed98d411187')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -D -m755 "omdbtool.py" "${pkgdir}/usr/bin/omdbtool"
    install -D -m644 "README.md" "${pkgdir}/usr/share/doc/omdbtool/README"
    install -D -m644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/omdbtool/LICENSE"
}
