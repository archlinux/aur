# $Id$
# Maintainer : Nicolas Perrin <booloki@lokizone.net>

pkgname=wait-for-it
pkgver=0.0+git20200823
pkgrel=2
pkgdesc="Script that will wait on the availability of a host and TCP port"
arch=(any)
license=('MIT')
url="https://github.com/vishnubob/wait-for-it"
source=('wait-for-it::git+https://github.com/vishnubob/wait-for-it.git'
        'wait-for-it.8.gz')
sha256sums=('SKIP'
            '36770f1d186b8be51a20d957ed2957ec1f8e16e772c37fe56942d4d57cc87de1')

package() {
    install -D -m644 "wait-for-it.8.gz" "${pkgdir}/usr/share/man/man8/wait-for-it.8.gz"

    cd "${srcdir}/${pkgname}"
    install -D -m755 "wait-for-it.sh" "${pkgdir}/usr/bin/wait-for-it"
    install -D -m644 "README.md" "${pkgdir}/usr/share/doc/wait-for-it/README"
}
