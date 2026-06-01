# Maintainer: Samueru-sama xdglawyer@outlook.com
pkgname=zenity-rs-bin
pkgver=0.2.8
pkgrel=1
pkgdesc="Rust rewrite of zenity, much smaller and faster"
arch=('aarch64' 'x86_64')
url="https://github.com/QaidVoid/zenity-rs"
license=('MIT')
provides=('zenity')
conflicts=('zenity')
source_x86_64=("https://github.com/QaidVoid/zenity-rs/releases/download/v$pkgver/zenity-rs-x86_64-linux")
source_aarch64=("https://github.com/QaidVoid/zenity-rs/releases/download/v$pkgver/zenity-rs-aarch64-linux")
sha256sums_x86_64=('797bd492a8723d741d888320ab87b934b0c4571a1ff2c128963a08daa35df8c7')
sha256sums_aarch64=('c3f8a11fdc17632ffe3d5b1640a931139c2b8d86145c531e0f4db8a63ca3f2a2')
package() {
    cd "${srcdir}" || exit
    install -Dm755 "${srcdir}"/zenity-rs-"${CARCH}"-linux "${pkgdir}"/usr/bin/zenity
}

