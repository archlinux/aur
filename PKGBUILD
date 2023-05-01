# Maintainer: Namkhai B. <echo hc.9mobkrof@em | rev>

pkgname=gyr-bin
pkgver=0.1.3
pkgrel=0
pkgdesc='Blazing fast TUI launcher for GNU/Linux and *BSD (prebuilt binary version)'
arch=('x86_64' 'aarch64')
url="https://sr.ht/~f9/gyr"
license=('BSD-2-Clause')
provides=('gyr')
conflicts=('gyr')
source_x86_64=("https://git.sr.ht/~f9/gyr/refs/download/v${pkgver}/gyr-v${pkgver}-x86_64-unknown-linux-musl")
sha256sums_x86_64=('1499d660af53120ff434f513a07648b2cb7d8d4242c88283e6c7d617db66be41')
b2sums_x86_64=('9442308b98b5e3b566ef14d4063cf220058048e253a681d88dec842b24844777abfafa5beb3446d730ceabbb946e1058dc952b1c9823d18668ea2483e9306796')
source_aarch64=("https://git.sr.ht/~f9/gyr/refs/download/v${pkgver}/gyr-v${pkgver}-aarch64-unknown-linux-musl")
sha256sums_aarch64=('faa2a189d66626c2544e15650039ef30526d26a4e64bc83115182a84a16260de')
b2sums_aarch64=('e1a02b225893a6e34e7376b5b5438471e6b2bfccfbef5101961715a16fffa863c2ee80c4f4b67d12d7b668445044762e406c5ea2c1bbaaa30abbd6d00ae203e9')

package() {
    install -Dm755 "gyr-v${pkgver}-${CARCH}-unknown-linux-musl" \
        "${pkgdir}/usr/bin/gyr"
}
