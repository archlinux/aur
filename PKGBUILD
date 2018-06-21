# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>

pkgname=latex-pgfplots
pkgname_=pgfplots
pkgver=1.16
pkgrel=1
pkgdesc='Allows drawing normal and/or logarithmic plots directly in TeX'
arch=(any)
url=http://sourceforge.net/projects/pgfplots/
license=(GPL)
install=pgfplots.install
depends=(tetex)
conflicts=(texlive-pictures)
source=("https://downloads.sourceforge.net/project/$pkgname_/$pkgname_/$pkgver/${pkgname_}_${pkgver}.tds.zip")
sha256sums=('7da7eb19ed2115b42e746bf4224d6ad8bdb1ca7a267f6108cfbbd1ad9c81203c')

package() {
    dest=${pkgdir}/usr/share/texmf-dist/tex/latex/$pkgname_
    install -d $dest

    cp -r doc scripts $dest
    cp -r tex/generic/$pkgname_/* $dest
    cp -r tex/latex/$pkgname_/*.sty $dest
    cp -r tex/latex/$pkgname_/libs/* $dest/libs
}
