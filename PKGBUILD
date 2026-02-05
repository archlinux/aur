# Maintainer: Samueru-sama xdglawyer@outlook.com
pkgname=zenity-rs-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Rust rewrite of zenity, much smaller and faster"
arch=('aarch64' 'x86_64')
url="https://github.com/QaidVoid/zenity-rs"
license=('MIT')
provides=('zenity')
conflicts=('zenity')
source_x86_64=("https://github.com/QaidVoid/zenity-rs/releases/download/v$pkgver/zenity-rs-x86_64-linux")
source_aarch64=("https://github.com/QaidVoid/zenity-rs/releases/download/v$pkgver/zenity-rs-aarch64-linux")
sha256sums_x86_64=('a01e34b8d4907a8e601547052abbbb12a3e9ec7aa552328889f17a008dba6769')
sha256sums_aarch64=('bf4aec3810924b1cef082851c42de7c3597741c394be1b5494b964cbce62085e')
package() {
    cd "${srcdir}" || exit
    install -Dm755 "${srcdir}"/zenity-rs-"${CARCH}"-linux "${pkgdir}"/usr/bin/zenity
}

