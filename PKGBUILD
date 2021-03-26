# Maintainer: Lev Levitsky <levlev@mail.ru>
pkgname=msamanda
_name=MSAmanda2.0_Standalone_Linux
pkgver=2.0.0.17442
pkgrel=1
pkgdesc="A scoring system to identify peptides out of tandem mass spectrometry data using a database of known proteins"
arch=('any')
url="http://ms.imp.ac.at/index.php?action=ms-amanda"
license=('custom')
depends=('mono')
options=()
source=("http://ms.imp.ac.at/index.php?file=msamanda/${_name}_${pkgver}.tar.gz"
        "msamanda")
md5sums=('69d8c5a876d274af052fe1ac20d8a4e5'
         'a870877935f5aed33fd0a7ec73e5abca')

package() {
    mkdir -p "$pkgdir/opt/MSAmanda"
    cp -rt "$pkgdir/opt/MSAmanda" "${srcdir}/${_name}"/*
    mkdir -p "$pkgdir/usr/bin"
    cp -L msamanda "$pkgdir/usr/bin"
}
