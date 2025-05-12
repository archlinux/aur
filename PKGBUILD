  # Maintainer: rie_t <megumin at megu dot dev>
  pkgname=libmoonlight-launcher-bin
  pkgver=0.1.9
  pkgrel=1
  pkgdesc="The library used by moonlight-launcher"
  arch=('x86_64')
  url="https://github.com/MeguminSama/moonlight-launcher"
  license=("GPL-3.0-only")
  provides=("libmoonlight-launcher=${pkgver}")

  source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/MeguminSama/moonlight-launcher/releases/download/v${pkgver}/moonlight-stable-v${pkgver}.tar.gz")
  sha256sums_x86_64=('831c5677a20d4c015279d9bc38758f27e424832351cbff044748ca314aee09d5')

  package() {
      install -Dm755 "${srcdir}/libmoonlight_launcher.so" "${pkgdir}/usr/lib/libmoonlight_launcher.so"
  }
