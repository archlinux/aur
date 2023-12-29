# Maintainer: Filip Parag <filip@parag.rs>

pkgname=bas-celik-bin
pkgver=1.5.3
pkgrel=1
pkgdesc="A program for reading smart-card documents issued by the government of Serbia"
arch=("x86_64")
conflicts=("bas-celik")
provides=()
url="https://github.com/ubavic/bas-celik/"
license=("MIT")
depends=("ccid" "opensc")
source=("bas_celik-${pkgver}_amd64.tar.gz::https://github.com/ubavic/bas-celik/releases/download/v${pkgver}/bas-celik.linux.amd64.tar.xz")
sha256sums=('c44e42a56343bfb0403862a66f74fd16072483b510b87190ef1b86a6e35418ce')

package()
{
    export DESTDIR="${pkgdir}"
    export PREFIX="/usr"
    cd "${srcdir}"
    make install
}
