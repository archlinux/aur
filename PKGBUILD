# Maintainer: Moriaan Michiels <moriaan.michiels@gmail.com>
pkgname=jcd-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Fuzzy cd alternative"
arch=('x86_64')
url="https://github.com/MnM72809/jcd"
license=('MIT')
provides=('jcd')
conflicts=('jcd')
source=("https://github.com/MnM72809/jcd/releases/download/v${pkgver}/jcd-${pkgver}-Linux.tar.gz")
sha256sums=('sha256:99cd3d033568f0dbf8d0481f61a72df00329138b10378cd268ad6e63f2dbdb48')

package() {
    # Extracting the tarball places the binary inside usr/local/bin/
    # We install it natively to /usr/bin for Arch compliance
    install -Dm755 "${srcdir}/usr/local/bin/jcd" "${pkgdir}/usr/bin/jcd"
}
