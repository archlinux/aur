# Maintainer: Lev Levitsky <levlev@mail.ru>
pkgname=msamanda
_name=MSAmanda2.0_Standalone_Linux
pkgver=2.0.0.18350
pkgrel=2
pkgdesc="A scoring system to identify peptides out of tandem mass spectrometry data using a database of known proteins"
arch=('any')
url="http://ms.imp.ac.at/index.php?action=ms-amanda"
license=('custom')
depends=('mono')
options=()
source=("http://ms.imp.ac.at/index.php?file=msamanda/${_name}_${pkgver}.tar.gz"
        "msamanda")
md5sums=('35a7d7f623040239ae9ef2ca18e1301f'
         'a870877935f5aed33fd0a7ec73e5abca')

package() {
    mkdir -p "$pkgdir/opt/MSAmanda"
    cp -rt "$pkgdir/opt/MSAmanda" "${srcdir}/${_name}_${pkgver}"/*
    mkdir -p "$pkgdir/usr/bin"
    cp -L msamanda "$pkgdir/usr/bin"
}
