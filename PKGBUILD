# Maintainer: rie_t <megumin at megu dot dev>
pkgname=libmoonlight-launcher-bin
pkgver=0.1.11
pkgrel=1
pkgdesc="The library used by moonlight-launcher"
arch=('x86_64')
url="https://github.com/MeguminSama/moonlight-launcher"
license=("GPL-3.0-only")
provides=("libmoonlight-launcher=${pkgver}")

source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/MeguminSama/moonlight-launcher/releases/download/v${pkgver}/moonlight-stable-v${pkgver}.tar.gz")
sha256sums_x86_64=('32f2e2c645e5fb2f6f21ea11643feb0d4fd954d1d850d27f2d0aaf349b1d3c95')

package() {
    install -Dm755 "${srcdir}/libmoonlight_launcher.so" "${pkgdir}/usr/lib/libmoonlight_launcher.so"
}
