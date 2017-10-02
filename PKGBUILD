# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>

pkgname=latex-pgfplots
pkgname_=pgfplots
pkgver=1.15
pkgrel=1
pkgdesc='Allows drawing normal and/or logarithmic plots directly in TeX'
arch=(any)
url=http://sourceforge.net/projects/pgfplots/
license=(GPL)
install=pgfplots.install
depends=(tetex)
conflicts=(texlive-pictures)
source=("https://downloads.sourceforge.net/project/$pkgname_/$pkgname_/$pkgver/${pkgname_}_${pkgver}.tds.zip")
sha256sums=('5ee8dadb25f22d9a0bd137646494bdc1aeffc2db21a7c5020b07fcac3006a123')

package() {
    dest=${pkgdir}/usr/share/texmf-dist/tex/latex/$pkgname_
    install -d $dest

    cp -r doc scripts $dest
    cp -r tex/generic/$pkgname_/* $dest
    cp -r tex/latex/$pkgname_/*.sty $dest
    cp -r tex/latex/$pkgname_/libs/* $dest/libs
}
