# Maintainer: Evann DREUMONT <hello(at)evann(dot)tech>

pkgname=newtex-git
pkgver=0.0.1
pkgrel=1
pkgdesc='A modern LaTeX class'
arch=('any')
url='https://github.com/leGmask/NewTeX'
license=('MIT')
depends=('texlive-core')
source=(https://github.com/leGmask/NewTex/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('4b76a4d0154b9ff92ad61432711d3fec6f2dfc938aefe1a95e8677f84425bd0b')

package() {

  cd "$srcdir"

  mkdir -p "$pkgdir"/usr/share/texmf/tex/latex/NewTeX

  install -m444 "$srcdir"/$pkgname-$pkgver/NewTeX.cls "$pkgdir"/usr/share/texmf/tex/latex/NewTeX/
}

