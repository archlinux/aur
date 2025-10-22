# Maintainer: Mrinmoy <mrinmoyin@duck.com>
pkgname=compose-cli-bin
pkgver=0.0.21
pkgrel=2
epoch=
pkgdesc="Compose Cli — for Android devs who live in the terminal "
arch=(x86_64)
url="https://mrinmoyin.gitlab.io/compose-cli"
license=('BSD-4')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=(compose)
conflicts=(compose)
replaces=()
backup=()
options=(!debug)
install=
changelog=
source_x86_64=(compose-cli-$pkgver-$pkgrel.tar.xz::https://gitlab.com/mrinmoyin/compose-cli/-/releases/v${pkgver}/downloads/compose-cli-v${pkgver}.tar)
noextract=()
sha256sums_x86_64=(4c016435d1ea7d7ed62ea6866eb2ed6c85473aed42b8c049689d53701301d3ce)
validpgpkeys=()

package() {
    install -dm755 "${pkgdir}/usr/share/${pkgname}"
    install -dm755 "${pkgdir}/usr/bin"

    cp -ra ./app/lib ./app/bin "${pkgdir}/usr/share/${pkgname}"
    ln -s "/usr/share/${pkgname}/bin/app" "${pkgdir}/usr/bin/compose"
}
