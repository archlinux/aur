# Submitter: Awebb  <awebb@sa-mail.org>

pkgname=texlive-avm
pkgver=1.03
pkgrel=1
license=('custom')
depends=('texlive-core')
pkgdesc="A latex style for attribute-value matrices"
url="http://nlp.stanford.edu/~manning/tex/"
arch=('any')
install=texlive-avm.install
source=("http://nlp.stanford.edu/~manning/tex/avm.sty"
	"http://nlp.stanford.edu/~manning/tex/avm-doc.tex")
md5sums=('edb92c7995afc59e029f5cc4490b1962'
         '21c3fb1470effca2ffe02bf291a4c14d')
package()
{
  mkdir -p $pkgdir/usr/share/texmf/tex/latex/avm
  cp $srcdir/avm.sty $pkgdir/usr/share/texmf/tex/latex/avm
  cp $srcdir/avm-doc.tex $pkgdir/usr/share/texmf/tex/latex/avm
}

