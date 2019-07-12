# Original author: Josiah Schwab <jschwab at gmail dot com>
# Maintainer: Josiah Schwab <jschwab at gmail dot com>

pkgname=texlive-aastex6
pkgdesc="Package for preparing papers in American Astronomical Society (AAS) journals "
pkgver=6.3
pkgrel=1
arch=('i686' 'x86_64')
url="http://journals.aas.org/authors/aastex.html"
depends=('texlive-core' 'texlive-publishers')
provides=('texlive-aastex6')
install=texlive-aastex6.install
source=('https://journals.aas.org/wp-content/uploads/2019/06/aastex63.cls'
        'https://journals.aas.org/wp-content/uploads/2019/06/aasjournal.bst')
sha1sums=('6b02c31b19a8713526212d7dd524a776ecfcbf7e'
          '88fda6521f0c8cf4d4fb77dfb572e7005c90206b')


package() {

  cd "$srcdir"

  # install current files
  install -Dm644 aastex63.cls $pkgdir/usr/share/texmf/tex/latex/aastex/aastex63.cls
  install -Dm644 aasjournal.bst $pkgdir/usr/share/texmf/bibtex/bst/aastex/aasjournal.bst

}
