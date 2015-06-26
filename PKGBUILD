# Contributor: Mac Mollison <mollison at cs dot unc dot edu>
# Maintainer: Benoit Favre <benoit.favre@lif.univ-mrs.fr>
pkgname=latex-wrapfig
pkgver=3.6
pkgrel=2
pkgdesc="Produces figures which text can flow around."
arch=('i686' 'x86_64')
url="http://tug.ctan.org/tex-archive/macros/latex/contrib/wrapfig/"
license=('custom:latex')
depends=('texlive-core')
conflicts=('texlive-latexextra')
install="$pkgname.install"
source=(http://mirrors.ctan.org/macros/latex/contrib/wrapfig/wrapfig.sty)
md5sums=(3701aebf80ccdef248c0c20dd062fea9)

package() {
    mkdir -p $pkgdir/usr/share/texmf-dist/tex/latex/wrapfig
    install -D $srcdir/wrapfig.sty $pkgdir/usr/share/texmf-dist/tex/latex/wrapfig/wrapfig.sty
}
