# Maintainer: Wouter de Vries <wouter@wbdv.nl>
pkgname=brouwhulp
pkgver=5.3.5.2
pkgrel=5
pkgdesc="a program to design and document beer brewing recipes"
url="http://wittepaard.roodetoren.nl/index.php/brouwhulp"
arch=("x86_64")
depends=("fann" "qt4pas" "openal")
provides=("brouwhulp")
source=("http://wittepaard.roodetoren.nl/phocadownload/userupload/${pkgname}_${pkgver}_amd64.deb")
sha256sums=('42286a2589fa923719258d9b0b600a11491e874f2555f6a7fa65f2cd8807759e')

prepare() {
    tar -xaf data.tar.xz
}

package() {
    cp -r usr "$pkgdir/"
}
