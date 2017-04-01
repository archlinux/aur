# Maintainer: blm768 <https://aur.archlinux.org/account/blm768>

# Based on the texlive-gantt PKGBUILD
# Contributor: Alfredo Palhares <masterkorp@gmail.com>
# Contributor: Martin Kumm <pluto@ls68.de>

pkgname=texlive-pgfopts
pkgver=2.1a
pkgrel=2
license=('custom')
depends=('texlive-core' 'texlive-latexextra')
pkgdesc='LaTeX package options with pgfkeys'
url='https://www.ctan.org/pkg/pgfopts?lang=en'
arch=('any')
install=${pkgname}.install
source=('http://mirrors.ctan.org/install/macros/latex/contrib/pgfopts.tds.zip')
sha256sums=('eb38d68b79bd379ef93af83f9a16ef694a47b30044b74e70bcbeb64b6fcf7ce6')

package() {
  mkdir -p $pkgdir/usr/share/texmf/tex/latex/pgfopts
  install -D -m644 $srcdir/tex/latex/pgfopts/pgfopts.sty $pkgdir/usr/share/texmf/tex/latex/pgfopts
  install -D -m644 $srcdir/doc/latex/pgfopts/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

