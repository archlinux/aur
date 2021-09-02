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
sha256sums=('af48523588f49e49c08de30c8e935ca7bd31daa86191cdc92c91ee89ee02b32e')

package() {

  cd "$srcdir"

  mkdir -p "$pkgdir"/usr/share/texmf/tex/latex/NewTeX

  install -m444 "$srcdir"/NewTeX-$pkgver/NewTeX.cls "$pkgdir"/usr/share/texmf/tex/latex/NewTeX/
}

