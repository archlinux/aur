# Maintainer: Wouter de Vries <wouter@wbdv.nl>
pkgname=brouwhulp
pkgver=5.3.5.2
pkgrel=1
pkgesc="Brouwhulp"
arch=("x86_64")
depends=("libfann" "qt4pas")
provides=("brouwhulp")
source=("http://wittepaard.roodetoren.nl/phocadownload/userupload/brouwhulp_5.3.5.2_amd64.deb")
md5sums=('bdb596324f6b36d8e713fdac4b540954')

prepare() {
    tar -xaf data.tar.xz
}

package() {
    cp -r usr $pkgdir/
}
