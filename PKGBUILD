# Maintainer: Samueru-sama xdglawyer@outlook.com
pkgname=zenity-rs-bin
pkgver=0.2.3
pkgrel=1
pkgdesc="Rust rewrite of zenity, much smaller and faster"
arch=('aarch64' 'x86_64')
url="https://github.com/QaidVoid/zenity-rs"
license=('MIT')
provides=('zenity')
conflicts=('zenity')
source_x86_64=("https://github.com/QaidVoid/zenity-rs/releases/download/v$pkgver/zenity-rs-x86_64-linux")
source_aarch64=("https://github.com/QaidVoid/zenity-rs/releases/download/v$pkgver/zenity-rs-aarch64-linux")
sha256sums_x86_64=('eb05ced21a9f563101faf0f666e5f95ecaf2bc9961bcec07f954c820e4940c76')
sha256sums_aarch64=('669573388d866dcd181bbaaafb3289317ef630cc680a3a7941ea263d50e7dd7d')
package() {
    cd "${srcdir}" || exit
    install -Dm755 "${srcdir}"/zenity-rs-"${CARCH}"-linux "${pkgdir}"/usr/bin/zenity
}

