# Maintainer: Filip Parag <filip@parag.rs>

pkgname=bas-celik-bin
pkgver=1.6.0
pkgrel=1
pkgdesc="A program for reading smart-card documents issued by the government of Serbia"
arch=("x86_64")
conflicts=("bas-celik")
provides=()
url="https://github.com/ubavic/bas-celik/"
license=("MIT")
depends=("ccid" "opensc")
source=("bas_celik-${pkgver}_amd64.tar.gz::https://github.com/ubavic/bas-celik/releases/download/v${pkgver}/bas-celik.linux.amd64.tar.xz")
sha256sums=('360b794ad4123eaf5e2681ecb7426750b7db8b590145c4a72dbfe03f2a9cb77e')

package()
{
    export DESTDIR="${pkgdir}"
    export PREFIX="/usr"
    cd "${srcdir}"
    make install
}
