# Maintainer: Samueru-sama xdglawyer@outlook.com
pkgname=zenity-rs-bin
pkgver=0.1.11
pkgrel=1
pkgdesc="Rust rewrite of zenity, much smaller and faster"
arch=('aarch64' 'x86_64')
url="https://github.com/QaidVoid/zenity-rs"
license=('MIT')
provides=('zenity')
conflicts=('zenity')
source_x86_64=("https://github.com/QaidVoid/zenity-rs/releases/download/v$pkgver/zenity-rs-x86_64-linux")
source_aarch64=("https://github.com/QaidVoid/zenity-rs/releases/download/v$pkgver/zenity-rs-aarch64-linux")
sha256sums_x86_64=('47ea7b9a93887dd31c818e5ddae43281245a6e0fe72aeefd19c9dbe47dd65d7c')
sha256sums_aarch64=('9f8c61b9b8821125c12c1e667ed32630b6dea074c4348f92cb569dbc0c7f87fe')
package() {
    cd "${srcdir}" || exit
    install -Dm755 "${srcdir}"/zenity-rs-"${CARCH}"-linux "${pkgdir}"/usr/bin/zenity
}

