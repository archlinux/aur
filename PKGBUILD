# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>

pkgname=latex-pgfplots
pkgname_=pgfplots
pkgver=1.13
pkgrel=1
pkgdesc='Allows drawing normal and/or logarithmic plots directly in TeX'
arch=(any)
url=http://sourceforge.net/projects/pgfplots/
license=(GPL)
install=pgfplots.install
depends=(tetex)
conflicts=(texlive-pictures)
source=("http://downloads.sourceforge.net/project/$pkgname_/$pkgname_/$pkgver/${pkgname_}_${pkgver}.tds.zip")
sha256sums=('771255ff9ca967b98db56a09c8c01874f7e72d191a6cb28a6ee811fad9be60ff')

package() {
    dest=${pkgdir}/usr/share/texmf-dist/tex/latex/$pkgname_
    install -d $dest

    cp -r doc scripts $dest
    cp -r tex/generic/$pkgname_/* $dest
    cp -r tex/latex/$pkgname_/*.sty $dest
    cp -r tex/latex/$pkgname_/libs/* $dest/libs
}
