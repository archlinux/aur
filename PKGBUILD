# Maintainer: Samueru-sama xdglawyer@outlook.com
pkgname=zenity-rs-bin
pkgver=0.1.9
pkgrel=2
pkgdesc="Rust rewrite of zenity, much smaller and faster"
arch=('aarch64' 'x86_64')
url="https://github.com/QaidVoid/zenity-rs"
license=('MIT')
provides=('zenity')
conflicts=('zenity')
source_x86_64=("https://github.com/QaidVoid/zenity-rs/releases/download/v$pkgver/zenity-rs-x86_64-linux")
source_aarch64=("https://github.com/QaidVoid/zenity-rs/releases/download/v$pkgver/zenity-rs-aarch64-linux")
sha256sums_x86_64=('fc4d54c526be8aa2ef37aabd823754038b61e42827e99e167f7b56b7778f3f74')
sha256sums_aarch64=('d3a323919dae67a3ff2e9c8d70aed7a4e3ac2d14b5a1c645a4854c1c1ef63a5c')
package() {
    cd "${srcdir}" || exit
    install -Dm755 "${srcdir}"/zenity-rs-"${CARCH}"-linux "${pkgdir}"/usr/bin/zenity
}

