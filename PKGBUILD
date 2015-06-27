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
md5sums=('8ced666ae466f63997854119ca592fe0')

package()
{
  cp "$srcdir/*" "$pkgdir/usr/share/texmf-dist/"
}
