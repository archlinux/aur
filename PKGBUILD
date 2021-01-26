# Maintainer: traumweh <contact@traumweh.tk>

_revision=0
pkgname=cis-latex
pkgver=1.${_revision}
pkgrel=1
pkgdesc="A LaTeX2e package with commands and tools for use in university"
arch=("any")
url="https://traumweh.tk/"
license=('LPPL')
depends=('texlive-core' 'texlive-latexextra')
source=("https://gitlab.com/traumweh/cis-latex/-/raw/main/tex/cis.sty")
install=texlive.install

package() {
  cd "$srcdir/"

  install -m775 -d "$pkgdir/usr/share/texmf-dist/tex/latex/cis"
  cp -R cis.sty "$pkgdir/usr/share/texmf-dist/tex/latex/cis"
}

md5sums=('53537937617679341b2b65d739e0005d')
