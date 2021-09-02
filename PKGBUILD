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
sha256sums=('b3e3c74e921c4bf6f9db3405f8bbac47fbdd815ee715b4a4d735b5b095ffc35e')

package() {

  cd "$srcdir"

  mkdir -p "$pkgdir"/usr/share/texmf/tex/latex/NewTeX

  install -m444 "$srcdir"/NewTeX-$pkgver/NewTeX.cls "$pkgdir"/usr/share/texmf/tex/latex/NewTeX/
}

