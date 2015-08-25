# Original author: Josiah Schwab <jschwab at gmail dot com>
# Maintainer: Josiah Schwab <jschwab at gmail dot com>

pkgname=texlive-mnras
pkgdesc="Package for preparing papers in the journal Monthly Notices of the Royal Astronomical Society"
pkgver=3.0
pkgrel=1
arch=('i686' 'x86_64')
url="http://mirrors.ctan.org/macros/latex/contrib/mnras"
depends=('texlive-core')
provides=('texlive-mnras')
install=texlive-mnras.install
source=('http://mirrors.ctan.org/macros/latex/contrib/mnras.zip')
sha1sums=('27b90967243e7284b982c23f7749182836fac398')

package() {
  cd "$srcdir/mnras"

  # install current files (v3)
  install -Dm644 mnras.cls $pkgdir/usr/share/texmf-dist/tex/latex/mnras/mnras.cls
  install -Dm644 mnras.bst $pkgdir/usr/share/texmf-dist/bibtex/bst/mnras/mnras.bst

  # install legacy files (v2.2)
  install -Dm644 legacy/mn2e.cls $pkgdir/usr/share/texmf-dist/tex/latex/mnras/mn2e.cls
  install -Dm644 legacy/mn2e.bst $pkgdir/usr/share/texmf-dist/bibtex/bst/mnras/mn2e.bst

}
