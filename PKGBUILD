## Maintainer: traumweh <contact@traumweh.tk>

_revision=0
pkgname=cis-latex
pkgver=2.${_revision}
pkgrel=0
pkgdesc="A LaTeX2e package with commands and tools for use in university"
arch=("any")
url="https://traumweh.tk/"
license=('LPPL')
source=("https://cis-exzellenz.de/files/cis-latex-2.${_revision}/tex/cis.sty")
depends=('texlive-core' 'texlive-latexextra' 'texlive-fontsextra' 'texlive-science' 'texlive-pictures')
install=texlive.install

package() {
  cd "$srcdir/"

  install -m775 -d "$pkgdir/usr/share/texmf-dist/tex/latex/cis"
  cp -R cis.sty "$pkgdir/usr/share/texmf-dist/tex/latex/cis"
}

sha256sums=('SKIP')
