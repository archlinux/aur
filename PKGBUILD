# Original author: Nicolas Kielbasiewicz (nicolas.kielbasiewicz@ensta-paristech.fr)
# Maintainer: Jakob Jungreithmeir <https://aur.archlinux.org/account/JakobJung>
# Maintainer: Debucquoy Anthony (tonitch) <d.tonitch@gmail.com>
# Last edited: 2nd November 2023

pkgname=texlive-tikz-uml
pkgver=1.0
pkgrel=1
_reldate=2016-03-29
license=('GPL')
depends=('texlive-core')
replaces=('texlive-tikzuml')
pkgdesc="A LaTeX package for drawing UML diagrams using pgf/tikz"
url="https://perso.ensta-paris.fr/~kielbasi/tikzuml/index.php"
arch=('any')
install="${pkgname}".install
source=(http://perso.ensta-paristech.fr/~kielbasi/tikzuml/var/files/src/tikzuml-v${pkgver}-${_reldate}.tbz)
sha256sums=('0cbc4a20c8ed40162b3b9ab1400b174293ec1ad7508e640ca879e78c45a105d0')

package() {
  install -Dm644 "$srcdir/tikzuml-v${pkgver}-${_reldate}/tikz-uml.sty" "$pkgdir/usr/share/texmf-dist/tex/latex/tikz-uml/tikz-uml.sty"
}
