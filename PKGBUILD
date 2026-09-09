# Maintainer: Samueru-sama xdglawyer@outlook.com
pkgname=zenity-rs-bin
pkgver=0.3.0
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
sha256sums_aarch64=('a75c846e9461aef13120686cdf62750025e8fa2f234d71cd6b9846cace50c561')
sha256sums_loongarch64=('419b835f6b9360964e1b6af49de875c908edc833fb8e141b2ee37233793e52c5')
sha256sums_ppc64=('35156779b7ad889b28599bfa0e8011e0ee2411d16d1a5b5bd0f7a87a8342f025')
sha256sums_ppc64le=('ece6a9349041b059dc8af81c9a9cd26c2f78557c9a79fc46568fa28afb67aeba')
sha256sums_riscv64=('a153287464925819d13ed7e2bb57996f8d83078be67518d1e6ea2eb6ac48e170')
sha256sums_x86_64=('f7a351180f364501855181420ceecd40b42ff84742ab79eca7aec43fe8ec074a')
package() {
    cd "${srcdir}" || exit
    install -Dm755 "${srcdir}"/zenity-rs-"${CARCH}"-linux "${pkgdir}"/usr/bin/zenity
}

