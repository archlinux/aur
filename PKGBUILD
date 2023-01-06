# Maintainer: Kauruus <kauruus@outlook.com>
pkgname=tuic-bin
pkgver=0.8.5
pkgrel=1
pkgdesc="Delicately-TUICed high-performance proxy built on top of the QUIC protocol" 
url="https://github.com/EAimTY/tuic"
license=("GPLv3")
arch=("x86_64")
provides=("tuic=$pkgver")

source=("https://github.com/EAimTY/tuic/releases/download/${pkgver}/tuic-client-${pkgver}-x86_64-linux-gnu"
        "https://github.com/EAimTY/tuic/releases/download/${pkgver}/tuic-server-${pkgver}-x86_64-linux-gnu")

sha256sums=('673a58a077714c233ca12369189103c09cc4110b7acc8bb3d6f602bbf2b974ff'
            '29e58e8527b7511bcf9f5719a5d292ae07e2ae0d972320ae0992c613c8abab86')

package() {
  install -Dm755 "tuic-client-${pkgver}-x86_64-linux-gnu" "${pkgdir}/usr/bin/tuic-client"
  install -Dm755 "tuic-server-${pkgver}-x86_64-linux-gnu" "${pkgdir}/usr/bin/tuic-server"
}

