# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>

pkgname=kaobook
pkgver=0.9.7
pkgrel=3
pkgdesc='A LaTeX class for books, reports or theses'
arch=('any')
url='https://github.com/fmarotta/kaobook'
license=('LPPL')
depends=('texlive-core')
source=(https://github.com/fmarotta/$pkgname/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('a92390533b430a57a3266c5152f272d14f2685d5ce50a37af604345ac2be9b53')

package() {

  cd "$srcdir"
  install -m444 "$srcdir"/$pkgname-$pkgver/kaohandt.cls "$pkgdir"/usr/share/texmf/tex/latex/kaobook/
  install -m444 "$srcdir"/$pkgname-$pkgver/kaobook.cls "$pkgdir"/usr/share/texmf/tex/latex/kaobook/
  install -m444 "$srcdir"/$pkgname-$pkgver/kao.sty "$pkgdir"/usr/share/texmf/tex/latex/kaobook/
  install -m444 "$srcdir"/$pkgname-$pkgver/kaobiblio.sty "$pkgdir"/usr/share/texmf/tex/latex/kaobook/
  install -m444 "$srcdir"/$pkgname-$pkgver/kaorefs.sty "$pkgdir"/usr/share/texmf/tex/latex/kaobook/
  install -m444 "$srcdir"/$pkgname-$pkgver/kaotheorems.sty "$pkgdir"/usr/share/texmf/tex/latex/kaobook/

}
