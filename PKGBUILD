# Maintainer: Jaime Martínez Rincón <jaime(at)jamezrin(dot)name>

pkgname=httptoolkit-bin
pkgver=0.1.20
pkgrel=1
pkgdesc="Beautiful, cross-platform & open-source HTTP(S) proxy, analyzer and client."
arch=("x86_64")
url="https://httptoolkit.tech/"
license=('GPL3')
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=(httptoolkit)
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/httptoolkit/httptoolkit-desktop/releases/download/v${pkgver}/httptoolkit_${pkgver}_amd64.deb")
noextract=()
md5sums=('062bd77445b9e9a2e8cff375deda33b1')
validpgpkeys=()

package() {
    # Extract package fs from deb
    bsdtar -O -xf "httptoolkit_${pkgver}_amd64.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

    # Set all directories to 755 mode
    find "${pkgdir}" -type d -exec chmod 755 {} +
}
