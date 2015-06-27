# Author: Maverick (basic89@gmail.com)
# Last edited: 27.06.15

pkgname=texlive-tubslatex
pkgver=1.1
pkgrel=1
reldate=2015-04-20
#license=('CCPL')
depends=('texlive-core')
pkgdesc="LaTeX-Templates for the Corporate Design of TU Braunschweig"
url="http://http://tubslatex.ejoerns.de"
arch=('any')
install=texlive-tubslatex.install
source=(http://tubslatex.ejoerns.de/1.1.0/tubslatex_1.1.0.tds.zip)
md5sums=('3768f97ff43dc5cdf5faa52d42b18dd5')

package()
{
  mkdir -p "$pkgdir/usr/share/texmf-dist/"
  cp -R "$srcdir/fonts" "$pkgdir/usr/share/texmf-dist/"
  cp -R "$srcdir/doc" "$pkgdir/usr/share/texmf-dist/"
  cp -R "$srcdir/tex" "$pkgdir/usr/share/texmf-dist/"
}
