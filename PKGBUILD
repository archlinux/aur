# Maintainer: Wouter de Vries <wouter@wbdv.nl>
pkgname=brouwhulp
pkgver=5.3.5.2
pkgrel=2
pkgdesc="a program to design and document beer brewing recipes"
url="http://wittepaard.roodetoren.nl/index.php/brouwhulp"
arch=("x86_64")
depends=("fann" "qt4pas")
provides=("brouwhulp")
source=("http://wittepaard.roodetoren.nl/phocadownload/userupload/brouwhulp_5.3.5.2_amd64.deb")
md5sums=('bdb596324f6b36d8e713fdac4b540954')

prepare() {
    tar -xaf data.tar.xz
}

package() {
    cp -r usr $pkgdir/
}
