# Original author: Josiah Schwab <jschwab at gmail dot com>
# Maintainer: Josiah Schwab <jschwab at gmail dot com>

pkgname=texlive-aastex6
pkgdesc="Package for preparing papers in American Astronomical Society (AAS) journals "
pkgver=1.0
pkgrel=3
arch=('i686' 'x86_64')
url="http://journals.aas.org/authors/aastex.html"
depends=('texlive-core')
provides=('texlive-aastex6')
install=texlive-aastex6.install
source=('http://journals.aas.org/authors/aastex/aastex6.cls'
        'http://journals.aas.org/authors/aastex/aasjournal.bst')
sha1sums=('f80e893e9d75b2e8c10fc08db613334e152f2bfa'
          'bea068ae11acc248b75b5861e7a3915cc2dfc735')

package() {
  cd "$srcdir"

  # install current files (v3)
  install -Dm644 aastex6.cls $pkgdir/usr/share/texmf-dist/tex/latex/aastex6/aastex6.cls
  install -Dm644 aasjournal.bst $pkgdir/usr/share/texmf-dist/bibtex/bst/aastex6/aasjournal.bst


}
