# Maintainer: Lev Levitsky <levlev@mail.ru>
pkgname=msamanda
pkgver=2.0.0.10695
pkgrel=3
pkgdesc="A scoring system to identify peptides out of tandem mass spectrometry data using a database of known proteins"
arch=('any')
url="http://ms.imp.ac.at/index.php?action=ms-amanda"
license=('custom')
depends=('mono')
options=()
source=("http://ms.imp.ac.at/index.php?file=MSAmanda2.0_Standalone_${pkgver}.zip"
        "msamanda")
md5sums=('24b9fc6782f1a62933de90b04d7190d4'
         'a870877935f5aed33fd0a7ec73e5abca')

package() {
    mkdir -p "$pkgdir/opt/MSAmanda"
    cp -rLt "$pkgdir/opt/MSAmanda" "$srcdir"/*
    mkdir -p "$pkgdir/usr/bin"
    cp -L msamanda "$pkgdir/usr/bin"
}
