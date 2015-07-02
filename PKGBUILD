# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
pkgname=texlive-usenix
pkgver=1.2
pkgrel=1
pkgdesc="TeX Live - LaTeX package for USENIX conferences"
arch=(any)
url="http://www.usenix.org"
license=('GPL')
depends=('texlive-core')
install=texlive.install
source=("http://www.usenix.org/events/samples/usenix.sty"
        "http://www.usenix.org/events/samples/template.la")
sha256sums=('2f60e059b2bb7f75d67c9ecd1fe3ba494e5f342a44079678f5b7da569ce97157'
            '6f5de8be9143ce91ce99b508025d67624479b42ebdd6fd5afe715d4fda666677')

package() {
  install -Dm644 "$srcdir/usenix.sty" "$pkgdir/usr/share/texmf-dist/tex/latex/usenix/usenix.sty"
  install -Dm644 "$srcdir/template.la" "$pkgdir/usr/share/doc/texlive-usenix/template.la"
}

# vim:set ts=2 sw=2 et:
