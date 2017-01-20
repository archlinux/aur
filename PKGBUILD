# Original author: Nicolas Kielbasiewicz (nicolas.kielbasiewicz@ensta-paristech.fr)
# Maintainer: Jakob Jungreithmeir <https://aur.archlinux.org/account/JakobJung>
# Last edited: 20th January 2017

pkgname=texlive-tikz-uml
pkgver=1.0
pkgrel=1
_reldate=2016-03-29
license=('GPL')
depends=('texlive-core')
pkgdesc="A LaTeX package for drawing UML diagrams using pgf/tikz"
url="http://www.ensta-paristech.fr/~kielbasi/tikzuml/index.php?lang=en"
arch=('any')
install="${pkgname}".install
source=(http://perso.ensta-paristech.fr/~kielbasi/tikzuml/var/files/src/tikzuml-v${pkgver}-${_reldate}.tbz)
md5sums=('8065a79c8cdf6fc99251d569dbaa65ec')

package() {
  install -Dm644 "$srcdir/tikzuml-v${pkgver}-${_reldate}/tikz-uml.sty" "$pkgdir/usr/share/texmf-dist/tex/latex/tikz-uml/tikz-uml.sty"
}
