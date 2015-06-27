# Author: Maverick (basic89@gmail.com)
# Based on texlive-tikz-uml PKGBUILD from: Nicolas Kielbasiewicz (nicolas.kielbasiewicz@ensta-paristech.fr)
# Last edited: 10.05.15

pkgname=texlive-tikz-dsp
pkgver=0.1
pkgrel=1
reldate=2012-11-18
license=('CCPL')
depends=('texlive-core')
pkgdesc="A LaTeX package for drawing DSP diagrams using pgf/tikz"
url="http://www.texample.net/tikz/examples/fir-filter/"
arch=('any')
install=texlive-tikz-dsp.install
source=(http://www.texample.net/media/tikz/examples/zip/tikz-dsp.zip)
md5sums=('8ced666ae466f63997854119ca592fe0')

package()
{
  mkdir -p "$pkgdir/usr/share/texmf-dist/tex/latex/tikz-dsp"
  cp "$srcdir/library/tex/latex/tikz-dsp/tikz-dsp.sty" "$pkgdir/usr/share/texmf-dist/tex/latex/tikz-dsp"
  cp "$srcdir/library/tex/latex/tikz-dsp/tikzlibrarydsp.code.tex" "$pkgdir/usr/share/texmf-dist/tex/latex/tikz-dsp"
}
