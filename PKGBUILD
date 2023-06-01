# Maintainer: Ingo Meyer <IJ_M@gmx.de>

pkgname="sysinfo"
pkgver="0.0.0"
pkgrel="1"
pkgdesc="sysinfo shows system information like the hardware configuration and resource usage in a compact, clearly arranged and
visually pleasing style."
arch=("any")
url="https://github.com/IngoMeyer441/sysinfo"
license=("MIT")
depends=("bash" "gawk")
source=("https://github.com/IngoMeyer441/sysinfo/archive/v${pkgver}.tar.gz")
sha256sums=("SKIP")

build() {
    cd "${srcdir}/${pkgname}-${pkgver}" || return
    make build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}" || return
    DESTDIR="${pkgdir}" make install
}
