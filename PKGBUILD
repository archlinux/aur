# Maintainer: Gil Forsyth <gilforsyth@gmail.com> 

pkgname=searchtobibtex
pkgver=1.0
pkgrel=1
pkgdesc="Tools to manage bibtex and pdfs via crossref searches"
license=(GPL3)
arch=('i686' 'x86_64')
url="https://github.com/atisharma/searchtobibtex"
source=(git://github.com/atisharma/searchtobibtex.git)
md5sums=('SKIP')
depends=('bibtool' 'bibclean' 'curl')
makedepends=('git')

build() {
    cd "${pkgname}"
}
package() {
    cd "${pkgname}"
    install -Dm755 bin/bibtidy "${pkgdir}/usr/bin/bibtidy"
    install -Dm755 bin/doitobibtex "${pkgdir}/usr/bin/doitobibtex"
    install -Dm755 bin/pdf-rename-by-doi "${pkgdir}/usr/bin/pdf-rename-by-doi"
    install -Dm755 bin/pdftobibtex "${pkgdir}/usr/bin/pdftobibtex"
    install -Dm755 bin/searchtobibtex "${pkgdir}/usr/bin/searchtobibtex"
    install -Dm755 bin/searchtobrowser "${pkgdir}/usr/bin/searchtobrowser"
    install -Dm644 man/doitobibtex.1 "${pkgdir}/usr/share/man/man1/doitobibtex.1.gz"
    install -Dm644 man/pdf-rename-by-doi.1 "${pkgdir}/usr/share/man/man1/pdf-rename-by-doi.1.gz"
    install -Dm644 man/pdftobibtex.1 "${pkgdir}/usr/share/man/man1/pdftobibtex.1.gz"
    install -Dm644 man/searchtobibtex.1 "${pkgdir}/usr/share/man/man1/searchtobibtex.1.gz"
    install -Dm644 man/searchtobrowser.1 "${pkgdir}/usr/share/man/man1/searchtobrowser.1.gz"
}

