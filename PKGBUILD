# Maintainer: MoeRT09 <https://aur.archlinux.org/account/MoeRT09>

pkgname=texlive-llncs
pkgver=2.19
pkgrel=1
license=('GPL')
depends=('texlive-core' 'texlive-latexextra')
pkgdesc='LaTeX2e package for Lecture Notes in Computer Science (LNCS) of Springer-Verlag'
url='ftp://ftp.springer.de/pub/tex/latex/llncs/latex2e/'
arch=('any')
install=texlive-llncs.install
source=('ftp://ftp.springer.de/pub/tex/latex/llncs/latex2e/llncs2e.zip')
sha256sums=('a4b7ee847198305fa45f1e2bdc59c9360590d62c7dd2db4afb5104e7d7dd3f58')

package() {
  mkdir -p $pkgdir/usr/share/texmf/tex/latex/llncs
  cp $srcdir/llncs.cls $pkgdir/usr/share/texmf/tex/latex/llncs
  cp $srcdir/llncsdoc.sty $pkgdir/usr/share/texmf/tex/latex/llncs
  cp $srcdir/sprmindx.sty $pkgdir/usr/share/texmf/tex/latex/llncs
  cp $srcdir/splncs03.bst $pkgdir/usr/share/texmf/tex/latex/llncs
  cp $srcdir/aliascnt.sty $pkgdir/usr/share/texmf/tex/latex/llncs
  cp $srcdir/remreset.sty $pkgdir/usr/share/texmf/tex/latex/llncs
} 
