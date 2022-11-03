# Maintainer: Ingo Meyer <IJ_M@gmx.de>

pkgname="playerctl-shift"
pkgver="0.0.0"
pkgrel="1"
pkgdesc="A convenience tool to shift to the next media player when using playerctl."
arch=("any")
url="https://github.com/IngoMeyer441/playerctl-shift"
license=("MIT")
depends=("playerctl")
makedepends=("make")
source=("https://github.com/IngoMeyer441/playerctl-shift/archive/v${pkgver}.tar.gz")
sha256sums=("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")

package() {
    cd "${srcdir}/${pkgname}-${pkgver}" || return
    make DESTDIR="${pkgdir}" PREFIX=/usr install
}
