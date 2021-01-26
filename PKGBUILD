## Maintainer: traumweh <contact@traumweh.tk>

_revision=5
pkgname=cis-latex
pkgver=1.${_revision}
pkgrel=1
pkgdesc="A LaTeX2e package with commands and tools for use in university"
arch=("any")
url="https://traumweh.tk/"
license=('LPPL')
depends=('texlive-core' 'texlive-latexextra' 'texlive-fontsextra' 'texlive-science' 'texlive-pictures')
source=("https://gitlab.com/traumweh/cis-latex/-/raw/bc0f531cdb4c7bd24d2bcaf48ceff73a5ecaba77/tex/cis.sty")
install=texlive.install

package() {
  cd "$srcdir/"

  install -m775 -d "$pkgdir/usr/share/texmf-dist/tex/latex/cis"
  cp -R cis.sty "$pkgdir/usr/share/texmf-dist/tex/latex/cis"
}

sha256sums=('9c86a0f4783aed92916d70ed1a2dcc552102110589bd091e8b49157bea51fd2e')
