# Maintainer: Ingo Meyer <IJ_M@gmx.de>

pkgname="playerctl-shift"
pkgver="0.1.0"
pkgrel="1"
pkgdesc="A convenience tool to shift to the next media player when using playerctl."
arch=("any")
url="https://github.com/IngoMeyer441/playerctl-shift"
license=("MIT")
depends=("playerctl")
makedepends=("make")
source=("https://github.com/IngoMeyer441/playerctl-shift/archive/v${pkgver}.tar.gz")
sha256sums=("bb33d5f33bd310e5e9b593bccd58ce3b60419915ac186839c68094ba68d882aa")

package() {
    cd "${srcdir}/${pkgname}-${pkgver}" || return
    make DESTDIR="${pkgdir}" PREFIX=/usr install
}
