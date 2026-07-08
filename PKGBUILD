# Maintainer: Lumina Nao <luminanao at duck.com>
pkgname=freeclaw
pkgver=7
pkgrel=1
pkgdesc="Community fork of OpenClaw with local inference improvements"
arch=(x86_64)
url="https://codeberg.org/LuminaNAO/freeclaw"
license=(MIT)
depends=(nodejs npm)
source=(git+https://codeberg.org/LuminaNAO/freeclaw.git#tag="v${pkgver}")
sha256sums=(SKIP)

package() {
    cd "${pkgname}"
    make DESTDIR="${pkgdir}" install
}
