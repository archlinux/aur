# shellcheck disable=SC2034,SC2086,SC2128,SC2148,SC2154,SC2164,SC2291
# Maintainer: Toria <ninetailedtori@uwu.gal>

pkgname="sway-desktop-env-hook"
pkgver=1.1
pkgrel=1
pkgdesc="Adds XDG_CURRENT_DESKTOP, XDG_SESSION_DESKTOP and XDG_SESSION_TYPE definitions to sway.desktop!"
arch=('any')
url=""
license=('GPL-3.0')
depends=(
    'sed'
)
provides=("${pkgname}=${pkgver}")
source=(
    "sway-desktop-env.hook"
)
install=${pkgname}.install

package() {
    cd              "${srcdir}"

    install -Dm644  'sway-desktop-env.hook'  "${pkgdir}/usr/share/libalpm/hooks/sway-desktop-env.hook"
}
sha256sums=('a5aab6545517d80249b10ce104d9d64df7e3b348994aec5d7789fe1b13b3fab6')
sha384sums=('1f7d32dd841fc990fd9f98c9f8fc69d2d7dce2495b9b2ae058b18a9dc6f34dab2f78f4993fa8159ca97a90b0d7858d39')
sha512sums=('9938c32e1e5b110138cdfc208c02a52962b6ceb66dca4204f810ebacc7df81d706f68be3ccaa6bb62e0caffff2a9989ea514104d45d45b068b6fb15c471e2943')
b2sums=('764ceea65ac7300fd274d471609b5d1b2e9b01162b1f8afec8da15211d9e07b8e8255bdaf5f4d01a9147a34009c9902454f811b40a81ba8d6ff1c2d3659afc13')
