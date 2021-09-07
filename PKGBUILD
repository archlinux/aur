# Maintainer: Evann DREUMONT <hello(at)evann(dot)tech>

pkgname=newtex-git
pkgver=0.0.2
pkgrel=2
pkgdesc='A modern LaTeX class'
arch=('any')
url='https://github.com/leGmask/NewTeX'
license=('MIT')
depends=('texlive-core' 'ttf-rubik' 'ttf-fira-code' 'minted')
source=(https://github.com/leGmask/NewTex/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('2cd6a1a4b41010044fbbf68436cf0401713da7ae0c4b6b6385646c136b0f5a13')

package() {

  cd "$srcdir"

  mkdir -p "$pkgdir"/usr/share/texmf/tex/latex/NewTeX

  install -m444 "$srcdir"/NewTeX-$pkgver/NewTeX.cls "$pkgdir"/usr/share/texmf/tex/latex/NewTeX/
}

