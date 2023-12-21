# Maintainer: Meow King <mr.meowking@anche.no>
pkgname=cyber
pkgver=0.3 # NOTE
pkgrel=1 # NOTE
pkgdesc="Fast and concurrent scripting. "
arch=("x86_64")
url="https://github.com/fubark/cyber"
license=('MIT')
makedepends=(
    "libarchive" # bsdtar
)
provides=("cyber" "cyberscript") 
conflicts=("cyber" "cyberscript")
changelog="changelog.txt" # NOTE
source=("${url}/releases/download/${pkgver}/cyber-linux-x64.tar.gz")
sha256sums=('0bd24ecee6ea20cfbc80d825cf8f9228fa837ce3aa141f7a4705190621b0a11b')

prepare() {
    # bsdtar -xf data.tar.gz
    echo 1
}

package() {
    echo 1
    # # bin
    # install -Dm755 usr/bin/flying-carpet ${pkgdir}/usr/bin/flying-carpet
    # # icons
    # mkdir -p ${pkgdir}/usr/share/icons/
    # chmod 755 ${pkgdir}/usr/share/icons
    # cp -r usr/share/icons/hicolor ${pkgdir}/usr/share/icons/
    # # desktop file
    # install -Dm644 usr/share/applications/flying-carpet.desktop ${pkgdir}/usr/share/applications/flying-carpet.desktop
}
