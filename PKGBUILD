# Maintainer: Filip Parag <filip@parag.rs>

pkgname=bas-celik-bin
pkgver=1.5.1
pkgrel=1
pkgdesc="A program for reading smart-card documents issued by the government of Serbia"
arch=("x86_64")
conflicts=("bas-celik")
provides=()
url="https://github.com/ubavic/bas-celik/"
license=("MIT")
depends=("ccid" "opensc")
source=("bas_celik-${pkgver}_amd64.tar.gz::https://github.com/ubavic/bas-celik/releases/download/v${pkgver}/bas-celik.linux.amd64.tar.xz")
sha256sums=('856f366f828b7fde4c58dc3633ef5f1baa0dc54ae18de8a2011df4212bdc47b5')

package()
{
    export DESTDIR="${pkgdir}"
    export PREFIX="/usr"
    cd "${srcdir}"
    make install
}
