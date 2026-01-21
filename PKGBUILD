# Maintainer: Samueru-sama xdglawyer@outlook.com
pkgname=zenity-rs-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="Rust rewrite of zenity, much smaller and faster"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/QaidVoid/zenity-rs"
license=('MIT')
provides=('zenity')
conflicts=('zenity')
source_x86_64=("https://github.com/QaidVoid/zenity-rs/releases/download/v$pkgver/zenity-rs-x86_64-linux")
source_aarch64=("https://github.com/QaidVoid/zenity-rs/releases/download/v$pkgver/zenity-rs-aarch64-linux")
sha256sums_x86_64=('1024f704814b09c961276ab8e0f0c2ca6c4145cfad20bcf4403b588eeb3033f2')
sha256sums_aarch64=('af126289544cc25a4f38e5d48e3d99a6de401b51254a02a860afadce0299f588')
package() {
    cd "${srcdir}" || exit
    install -Dm755 "${srcdir}"/zenity-rs-"${CARCH}"-linux "${pkgdir}"/usr/bin/zenity
}

