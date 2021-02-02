## Maintainer: traumweh <contact@traumweh.tk>

_revision=8
pkgname=cis-latex
pkgver=1.${_revision}
pkgrel=1
pkgdesc="A LaTeX2e package with commands and tools for use in university"
arch=("any")
url="https://traumweh.tk/"
license=('LPPL')
depends=('texlive-core' 'texlive-latexextra' 'texlive-fontsextra' 'texlive-science' 'texlive-pictures')
source=("https://gitlab.com/traumweh/cis-latex/-/raw/0073a2396851eb1ac9632b7d39f850f2efc145ff/tex/cis.sty")
install=texlive.install

package() {
  cd "$srcdir/"

  install -m775 -d "$pkgdir/usr/share/texmf-dist/tex/latex/cis"
  cp -R cis.sty "$pkgdir/usr/share/texmf-dist/tex/latex/cis"
}

sha256sums=('SKIP')
