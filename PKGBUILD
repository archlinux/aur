# Maintainer: Samueru-sama xdglawyer@outlook.com
pkgname=zenity-rs-bin
pkgver=0.2.14
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
sha256sums_aarch64=('aa14b551cb86c007be50a28dfa4191f4b6526ea24ececd8ba3efceff63be8aa3')
sha256sums_loongarch64=('95d58148d0e359979e471acc1a2fd27df3187978b6cf9a56f93cac822e138074')
sha256sums_ppc64=('f677d02718d724372ee8844c04c70bb4153826b23d375c0868b93ad4a5cab35c')
sha256sums_ppc64le=('c6668adf61c25499a154f7e204cc9fff2756ed2345b3271bf6dae22b871de0a0')
sha256sums_riscv64=('7faf8537700de533bd328a29a2238221106fe94791b7dd6c8384985740d2a04c')
sha256sums_x86_64=('d13cf2a42322b8f37c46137bccb0abe33164629ca9656f128a9860448323cca4')
package() {
    cd "${srcdir}" || exit
    install -Dm755 "${srcdir}"/zenity-rs-"${CARCH}"-linux "${pkgdir}"/usr/bin/zenity
}

