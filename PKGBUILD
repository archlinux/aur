# Maintainer: Davi da Silva Böger <dsboger@gmail.com>
pkgname=texlive-sbc-bookchapter
pkgver=20111103
pkgrel=1
pkgdesc='LaTeX class for Brazilian Computer Society book chapters'
arch=('any')
url="http://www.sbc.org.br/"
license=('LPPL')
depends=('texlive-core')
optdepends=('texlive-sbc-article: for sbc bibtex style')
install=$pkgname.install
_filename='sbc-bookchapter.zip'
source=("$_filename::http://www.sbc.org.br/index.php?option=com_jdownloads&Itemid=195&task=finish&cid=102&catid=32")
sha512sums=('4521c246c0840c65ca2c66a308da82b3449d37f2bf610220a8af62e98edfdecf6b5095cdead945fe493ac968d0f4ff3ea838057fda731481d93edb077e6b4e21')

package() {
  cd "${srcdir}"'/SBCbookchapter Folder/'
  
  # style class
  install -Dm644 SBCbookchapter.cls \
  	"${pkgdir}/usr/share/texmf-dist/tex/latex/sbc-bookchapter/SBCbookchapter.cls"
  
  # example document
  install -Dm644 sample-bookchapter.tex \
  	"${pkgdir}/usr/share/texmf-dist/tex/latex/sbc-bookchapter/example/sample-bookchapter.tex"
  install -Dm644 fig1.jpg \
  	"${pkgdir}/usr/share/texmf-dist/tex/latex/sbc-bookchapter/example/fig1.jpg"
  install -Dm644 fig2.jpg \
  	"${pkgdir}/usr/share/texmf-dist/tex/latex/sbc-bookchapter/example/fig2.jpg"
  install -Dm644 fig1.eps \
  	"${pkgdir}/usr/share/texmf-dist/tex/latex/sbc-bookchapter/example/fig1.eps"
  install -Dm644 fig2.eps \
  	"${pkgdir}/usr/share/texmf-dist/tex/latex/sbc-bookchapter/example/fig2.eps"
  install -Dm644 sample-bookchapter.pdf \
  	"${pkgdir}/usr/share/texmf-dist/tex/latex/sbc-bookchapter/example/sample-bookchapter.pdf"
}
