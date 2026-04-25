# shellcheck disable=SC2034,SC2086,SC2128,SC2148,SC2154,SC2164,SC2291
# Maintainer: Toria <ninetailedtori@uwu.gal>

pkgname="sway-desktop-unsupportedgpu-hook"
pkgver=2.0
pkgrel=1
pkgdesc="Adds --unsupported-gpu to sway.desktop!"
arch=('any')
url=""
license=('GPL-3.0')
depends=(
    'sed'
)
provides=("${pkgname}=${pkgver}")
source=(
    "sway-desktop-unsupportedgpu.hook"
)
install=${pkgname}.install

package() {
    cd              "${srcdir}"

    install -Dm644  'sway-desktop-unsupportedgpu.hook'  "${pkgdir}/usr/share/libalpm/hooks/sway-desktop-unsupportedgpu.hook"
}
sha256sums=('c7b00d014eb506465c9d19f4ab98b973d9956ed9e1a49ad4ea56314ee1de5234')
sha384sums=('65ebb64f723a00bbb0baaddb048c02c22dadd20478bd6b0be4645d2ea6354bd3c1af16dc1cbeff6afdbc6d304a328eaf')
sha512sums=('a6d8e8ae1ca7db2cfecd12dbda5975bb0612accf54131db02653abc0e05ab2d2cd66ed1bb826db017cdd37a80df13d494f860f21ccdb2f99ff2bf413c44f2b6e')
b2sums=('f971f8bba7fb114af3140354a78bf260356c29fb302f37eab3171637ca415337b6d301d4b1b1281466d684ac9623c468ce7a85d6e73804e022c4ebefd0979596')
