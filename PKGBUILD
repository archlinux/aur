# Maintainer: Namkhai B. <echo em.roekn@kn | rev>

pkgname=gyr-bin
pkgver=0.1.5
pkgrel=0
pkgdesc='Blazing fast TUI launcher for GNU/Linux and *BSD (prebuilt binary version)'
arch=('x86_64' 'aarch64')
url="https://sr.ht/~nkeor/gyr"
license=('BSD-2-Clause')
provides=('gyr')
conflicts=('gyr')
source_x86_64=("https://git.sr.ht/~nkeor/gyr/refs/download/v${pkgver}/gyr-v${pkgver}-x86_64-unknown-linux-musl")
sha256sums_x86_64=('3c5405c2e44eae7945670b992bc658230ddab9740ec4f936d9d995903c65a64d')
source_aarch64=("https://git.sr.ht/~nkeor/gyr/refs/download/v${pkgver}/gyr-v${pkgver}-aarch64-unknown-linux-musl")
sha256sums_aarch64=('87d4ca43738ddf60e5ef8b13dc96bf28f4dafee6f24e5c13dc512d4fb146b81b')

package() {
    install -Dm755 "gyr-v${pkgver}-${CARCH}-unknown-linux-musl" \
        "${pkgdir}/usr/bin/gyr"
}
