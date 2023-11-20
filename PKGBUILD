# Maintainer: Filip Parag <filip@parag.rs>

pkgname=bas-celik-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="A program for reading smart-card documents issued by the government of Serbia"
arch=("x86_64")
conflicts=("bas-celik")
provides=()
url="https://github.com/ubavic/bas-celik/"
license=("MIT")
depends=("ccid" "opensc")
source=("bas_celik-${pkgver}_amd64.tar.gz::https://github.com/ubavic/bas-celik/releases/download/v${pkgver}/bas-celik.linux.amd64.tar.xz")
sha256sums=('9d0cce5347af1015e379ca8b3828289f4ff31bce6f3b27722152f69b9f734bdc')

package()
{
    export DESTDIR="${pkgdir}"
    export PREFIX="/usr"
    cd "${srcdir}"
    make install
}
