#Maintainer: D.R. van Rossum <d.r.vanrossum at gmx.de>

pkgname=texlive-astronat
pkgver=1
pkgrel=1
license=('GPL')
depends=('texlive-core')
pkgdesc="BibTeX style files used in Astronomy journals"
url="http://ads.harvard.edu/pubs/bibtex/astronat/doc/html/astronat_1.html"
arch=('any')
install=texlive-astronat.install
source=(http://ads.harvard.edu/pubs/bibtex/astronat/astronat.tar.gz)
md5sums=('9f26cf9c2ac16ddeb7ac3aa677eab730')

package()
{
  mkdir -p $pkgdir/usr/share/texmf/bibtex/bst/
  cp $srcdir/astronat/apj/apj.bst $pkgdir/usr/share/texmf/bibtex/bst/
  cp $srcdir/astronat/mnras/mn.bst $pkgdir/usr/share/texmf/bibtex/bst/
}
