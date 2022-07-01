# Maintainer: Namkhai B. <echo hc.9mobkrof@em | rev>

pkgname=gyr-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='Blazing fast TUI launcher for *BSD and Linux'
arch=('x86_64' 'aarch64')
url="https://sr.ht/~forkbomb9/gyr"
license=('BSD-2-Clause')
makedepends=('rust')
provides=('gyr')
conflicts=('gyr')
source_x86_64=("https://git.sr.ht/~forkbomb9/gyr/refs/download/v${pkgver}/gyr-v${pkgver}-x86_64-unknown-linux-musl")
sha256sums_x86_64=('637b633f86d243851db33c71dbcbcd257d06f2fd27705306a26530b87d07497b')
b2sums_x86_64=('475c49c0d322e7c2247bb9ac09e95f33a96b3785caac237d914dac19fdf454d28bf5e7aa4d1fc2e688c33f82a971da87acca383496e1c93a94660190e434c103')
source_aarch64=("https://git.sr.ht/~forkbomb9/gyr/refs/download/v${pkgver}/gyr-v${pkgver}-aarch64-unknown-linux-musl")
sha256sums_aarch64=('9bebe8e31994dff8f3f45551adf00f4d97801c78e06fd417c08d3f0042b1fd78')
b2sums_aarch64=('9789acd77b4e83f9e6d34e91c19f2b0b5c0228676c051b164237c113c5c9a81dda33ade22612d3daf621bcaff4bbbf80c0d78d5fc5028918e2a519698bbcf830')

package() {
    install -Dm755 "gyr-v${pkgver}-${arch}-unknown-linux-musl" \
        "${pkgdir}/usr/bin/gyr"
}
