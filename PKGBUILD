# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=latex-enumitem
_pkgname=${pkgname#latex-}
pkgver=3.6
pkgrel=1
pkgdesc="Customize the three basic lists (enumerate, itemize and description)"
arch=('any')
url="http://www.ctan.org/tex-archive/macros/latex/contrib/enumitem"
license=('unknown')
depends=('texlive-core' 'unzip')
noextract=('enumitem.zip')
source=("http://mirror.ctan.org/macros/latex/contrib/$_pkgname.zip")
install="$pkgname.install"
sha256sums=('9ebcb5e70ff8ee4e1c9d28be8fbd7b5894f98bdefe4342c245980f6a108fcef1')

package() {
  install -dm755 "$pkgdir"/usr/share/texmf
  unzip -d "$pkgdir"/usr/share/texmf/tex enumitem.zip
}
