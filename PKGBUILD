# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>

pkgname=latex-pgfplots
pkgname_=pgfplots
pkgver=1.18.1
pkgrel=2
pkgdesc='Allows drawing normal and/or logarithmic plots directly in TeX'
arch=(any)
url=http://sourceforge.net/projects/pgfplots/
license=(GPL)
install=pgfplots.install
depends=(texlive-core)
source=("https://mirrors.ctan.org/graphics/pgf/contrib/pgfplots.zip")
sha256sums=('6263971bed627898013cf1e01aeff88d19308faf88fc8c091bd2408b3db0a271')

package() {
    dest=${pkgdir}/usr/share/texmf-dist/tex/latex/$pkgname_
    install -d $dest

    cd "$pkgname_"

    cp -r doc scripts tex $dest
}
