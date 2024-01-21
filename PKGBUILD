# Maintainer: Filip Parag <filip@parag.rs>

pkgname=bas-celik-bin
pkgver=1.5.4
pkgrel=1
pkgdesc="A program for reading smart-card documents issued by the government of Serbia"
arch=("x86_64")
conflicts=("bas-celik")
provides=()
url="https://github.com/ubavic/bas-celik/"
license=("MIT")
depends=("ccid" "opensc")
source=("bas_celik-${pkgver}_amd64.tar.gz::https://github.com/ubavic/bas-celik/releases/download/v${pkgver}/bas-celik.linux.amd64.tar.xz")
sha256sums=('9e7c56cc942e445402a748aa49091b9d9aaa64f84e16104be31d5b7728db036a')

package()
{
    export DESTDIR="${pkgdir}"
    export PREFIX="/usr"
    cd "${srcdir}"
    make install
}
