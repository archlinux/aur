# Maintainer: Namkhai B. <echo hc.9mobkrof@em | rev>

pkgname=gyr-bin
pkgver=0.1.4
pkgrel=0
pkgdesc='Blazing fast TUI launcher for GNU/Linux and *BSD (prebuilt binary version)'
arch=('x86_64' 'aarch64')
url="https://sr.ht/~f9/gyr"
license=('BSD-2-Clause')
provides=('gyr')
conflicts=('gyr')
source_x86_64=("https://git.sr.ht/~f9/gyr/refs/download/v${pkgver}/gyr-v${pkgver}-x86_64-unknown-linux-musl")
sha256sums_x86_64=('3fc791ce24fcd6cf4b842cf883818497d8194313a125725fca05caf9cf79824f')
source_aarch64=("https://git.sr.ht/~f9/gyr/refs/download/v${pkgver}/gyr-v${pkgver}-aarch64-unknown-linux-musl")
sha256sums_aarch64=('a25bde49d1a1c8fcfc5db0c87e864523fe0c2746b82dea805b37aacafaf87359')

package() {
    install -Dm755 "gyr-v${pkgver}-${CARCH}-unknown-linux-musl" \
        "${pkgdir}/usr/bin/gyr"
}
