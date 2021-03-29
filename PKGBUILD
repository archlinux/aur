# Maintainer: Matheus Gabriel Werny de Lima <matheusgwdl@protomail.com>
pkgname=keysmith
pkgver=0.2
pkgrel=1
epoch=
pkgdesc="OTP client for Plasma Mobile and Desktop"
arch=("any")
url="https://github.com/btcpayserver/${pkgname}"
license=("GPL3")
groups=()
depends=("frameworkintegration" "libsodium" "qt5-base")
makedepends=("cmake")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/KDE/keysmith/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
md5sums=("07ac50d5681fba2a771a459e88eadc6b")
validpgpkeys=()

build()
{
    cd ${srcdir}/${pkgname}/
    mkdir -p ${srcdir}/${pkgname}/build/
    cd ${srcdir}/${pkgname}/build/
    cmake ..
    make
}

package()
{
    cd ${srcdir}/${pkgname}/build/
    make install
}
