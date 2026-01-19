# Maintainer: Samueru-sama xdglawyer@outlook.com
pkgname=zenity-rs-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Rust rewrite of zenity, much smaller and faster"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/QaidVoid/zenity-rs"
license=('MIT')
source_x86_64=("https://github.com/QaidVoid/zenity-rs/releases/download/v$pkgver/zenity-rs-x86_64-linux")
source_aarch64=("https://github.com/QaidVoid/zenity-rs/releases/download/v$pkgver/zenity-rs-aarch64-linux")
sha256sums_x86_64=('86e332b39dec179ab2c877be61080bcef1e872af0207a0b5cd653f00861d11a0')
sha256sums_aarch64=('a8c37805f99cbae7d9eaea82861c9065f6ec33c0db56d7431da2068586c444fe')
package() {
    cd "${srcdir}" || exit
    install -Dm755 "${srcdir}"/zenity-rs-"${CARCH}"-linux "${pkgdir}"/usr/bin/zenity-rs
}

