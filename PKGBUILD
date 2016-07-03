# $Id$
# Maintainer : Nicolas Perrin <booloki@lokizone.net>


pkgname=imdb-cli
pkgver=2.3
pkgrel=1
pkgdesc="Command line tool for retrieving OMDb movie information"
arch=(any)
license=('(L)GPL3')
url="https://github.com/bgr/imdb-cli"
source=(https://github.com/bgr/${pkgname}/archive/v${pkgver}.tar.gz)
md5sums=('612d7833d07936f7c3147c2eb72f7c07')


package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -D -m755 "omdbtool.py" "${pkgdir}/usr/bin/omdbtool"
    install -D -m644 "README.md" "${pkgdir}/usr/share/doc/imdbtool/README"
    install -D -m644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/imdbtool/LICENSE"
    ln -s /usr/bin/omdbtool ${pkgdir}/usr/bin/imdbtool
}

