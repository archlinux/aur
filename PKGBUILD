# Original author: Josiah Schwab <jschwab at gmail dot com>
# Maintainer: Josiah Schwab <jschwab at gmail dot com>

pkgname=texlive-aastex6
pkgdesc="Package for preparing papers in American Astronomical Society (AAS) journals "
pkgver=1.0
pkgrel=1
arch=('i686' 'x86_64')
url="http://journals.aas.org/authors/aastex.html"
depends=('texlive-core')
provides=('texlive-aastex6')
install=texlive-aastex6.install
source=('http://journals.aas.org/authors/aastex/aastex6.cls'
        'http://journals.aas.org/authors/aastex/aasjournal.bst')
sha1sums=('efa9981ebbec6396249f82fee3b0a519dd59131a'
          '1f07745f3576b78268cea940effe9898c148abe3')

package() {
  cd "$srcdir"

  # install current files (v3)
  install -Dm644 aastex6.cls $pkgdir/usr/share/texmf-dist/tex/latex/aastex6/aastex6.cls
  install -Dm644 aasjournal.bst $pkgdir/usr/share/texmf-dist/bibtex/bst/aastex6/aasjournal.bst


}
