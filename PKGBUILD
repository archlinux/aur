# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
pkgname=texlive-usenix
pkgver=2020.09.21
pkgrel=1
pkgdesc="TeX Live - LaTeX package for USENIX conferences"
arch=(any)
url="https://www.usenix.org/conferences/author-resources/paper-templates"
license=('GPL')
depends=('texlive-core')
install=texlive.install
source=("https://www.usenix.org/sites/default/files/usenix-2020-09.sty"
        "https://www.usenix.org/sites/default/files/usenix2019_v3.1.tex")
sha256sums=('2278c83173e084a00fcf76d3227acb971f5137ecea993a5b4e13a9b2bd67b45e'
            'c03672ffcc30db0e0dd86d99b022721278836ff994930d51a5f26cdf53377311')

package() {
  install -Dm644 "$srcdir/usenix-2020-09.sty" "$pkgdir/usr/share/texmf-dist/tex/latex/usenix/usenix.sty"
  install -Dm644 "$srcdir/usenix2019_v3.1.tex" "$pkgdir/usr/share/doc/texlive-usenix/usenix-template.tex"
}

# vim:set ts=2 sw=2 et:
