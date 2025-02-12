# Maintainer: rie_t <megumin at megu dot dev>
pkgname=libmoonlight-launcher-bin
pkgver=0.1.7
pkgrel=1
pkgdesc="The library used by moonlight-launcher"
arch=('x86_64')
url="https://github.com/MeguminSama/moonlight-launcher"
license=("GPL-3.0-only")
provides=("libmoonlight-launcher=${pkgver}")

source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/MeguminSama/moonlight-launcher/releases/download/v${pkgver}/moonlight-stable-v${pkgver}.tar.gz")
sha256sums_x86_64=('03f9b093bee96ac27e55112313723bb472c0c12099ba1161f3f2352b77c9d0f4')

package() {
    install -Dm755 "${srcdir}/libmoonlight_launcher.so" "${pkgdir}/usr/lib/libmoonlight_launcher.so"
}
