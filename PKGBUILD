# Maintainer: Johan Reitan <johan.reitan@gmail.com>
# Contributor: Pascal Wittmann <mail@pascal-wittmann.de>
# Pull requests are welcome: https://github.com/pSub/pkgbuilds
pkgname=latex-tikz-er2
pkgver=0.0
pkgrel=1
pkgdesc="A LaTeX Package for Drawing Entity-Relationship Diagrams based on Tikz"
arch=('any')
url="https://bitbucket.org/pavel_calado/tikz-er2/wiki/Home"
license=('CC Attribution 2.5 Generic License.')
depends=('texlive-core')
install=$pkgname.install
source=(https://bitbucket.org/pavel_calado/tikz-er2/raw/da9f9f7f169647cad6d91df7975400b1605ae67a/tikz-er2.sty)
sha256sums=('25cb57a9de800bb5d6271c8233a90493d415fdbd1d01e9f3a33b49b373c6526d')

package() {
    install -dm755 "${pkgdir}/usr/share/texmf-dist/tex/latex/tikz-er2"
    cp tikz-er2.sty "${pkgdir}/usr/share/texmf-dist/tex/latex/tikz-er2"

    cd "${pkgdir}/usr/share/texmf-dist/tex/latex/"
    find . -type d -exec chmod 755 {} \;
    find . -type f -exec chmod 644 {} \;
}
