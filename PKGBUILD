# Maintainer: rie_t <megumin at megu dot dev>
pkgname=libmoonlight-launcher-bin
pkgver=0.1.7
pkgrel=2
pkgdesc="The library used by moonlight-launcher"
arch=('x86_64')
url="https://github.com/MeguminSama/moonlight-launcher"
license=("GPL-3.0-only")
provides=("libmoonlight-launcher=${pkgver}")

source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/MeguminSama/moonlight-launcher/releases/download/v${pkgver}/moonlight-stable-v${pkgver}.tar.gz")
sha256sums_x86_64=('cb4e3bb60b71433f674b080021d0cabddfd76515bb790359bede06785e80b547')

package() {
    install -Dm755 "${srcdir}/libmoonlight_launcher.so" "${pkgdir}/usr/lib/libmoonlight_launcher.so"
}
