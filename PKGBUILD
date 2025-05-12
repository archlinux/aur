# Maintainer: rie_t <megumin at megu dot dev>
pkgname=libmoonlight-launcher-bin
pkgver=0.1.10
pkgrel=1
pkgdesc="The library used by moonlight-launcher"
arch=('x86_64')
url="https://github.com/MeguminSama/moonlight-launcher"
license=("GPL-3.0-only")
provides=("libmoonlight-launcher=${pkgver}")

source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/MeguminSama/moonlight-launcher/releases/download/v${pkgver}/moonlight-stable-v${pkgver}.tar.gz")
sha256sums_x86_64=('77ac50c78f0421f505f7b8cf5308dafd11e6df399def06465805a845ad0bdc84')

package() {
    install -Dm755 "${srcdir}/libmoonlight_launcher.so" "${pkgdir}/usr/lib/libmoonlight_launcher.so"
}
