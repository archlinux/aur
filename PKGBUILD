# Maintainer: Samueru-sama xdglawyer@outlook.com
pkgname=zenity-rs-bin
pkgver=0.3.3
pkgrel=1
pkgdesc="Rust rewrite of zenity, much smaller and faster"
arch=('aarch64' 'loongarch64' 'ppc64' 'ppc64le' 'riscv64' 'x86_64')
url="https://github.com/QaidVoid/zenity-rs"
license=('MIT')
provides=('zenity')
conflicts=('zenity')
source_aarch64=("https://github.com/QaidVoid/zenity-rs/releases/download/v$pkgver/zenity-rs-aarch64-linux")
source_loongarch64=("https://github.com/QaidVoid/zenity-rs/releases/download/v$pkgver/zenity-rs-loongarch64-linux")
source_ppc64=("https://github.com/QaidVoid/zenity-rs/releases/download/v$pkgver/zenity-rs-ppc64-linux")
source_ppc64le=("https://github.com/QaidVoid/zenity-rs/releases/download/v$pkgver/zenity-rs-ppc64le-linux")
source_riscv64=("https://github.com/QaidVoid/zenity-rs/releases/download/v$pkgver/zenity-rs-riscv64-linux")
source_x86_64=("https://github.com/QaidVoid/zenity-rs/releases/download/v$pkgver/zenity-rs-x86_64-linux")
sha256sums_aarch64=('4907a96c0e239e56682eca5c20728f7c8284ab9ff388b0a871263c97d16b0d78')
sha256sums_loongarch64=('4248309aa5b6e344cc438d5c62969b7323ef4f8edb44a39415c9485fa33e1bed')
sha256sums_ppc64=('a11ac22368b9ebd244da15fd752a662497e949caa0c91ee63da0bb668d6c3bc4')
sha256sums_ppc64le=('9c339a9ec0bf5aae0c993e501fa84eb7b0b0801f92fa9b9179aeefef1565b210')
sha256sums_riscv64=('9e3a905ddd5452a763787ffa701b50d7dfb9cb6d402ae43d27096a8ccb9b3de8')
sha256sums_x86_64=('d9aeeeb6d50150e8f4562393a79083124df55b6dc5f8893cbc89b58058e117aa')
package() {
    cd "${srcdir}" || exit
    install -Dm755 "${srcdir}"/zenity-rs-"${CARCH}"-linux "${pkgdir}"/usr/bin/zenity
}

