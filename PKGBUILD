# Maintainer: Kauruus <kauruus@outlook.com>
pkgname=tuic-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Delicately-TUICed high-performance proxy built on top of the QUIC protocol" 
url="https://github.com/EAimTY/tuic"
license=("GPL3")
arch=("x86_64")
provides=("tuic=$pkgver")

source=("https://github.com/EAimTY/tuic/releases/download/tuic-client-${pkgver}/tuic-client-${pkgver}-x86_64-unknown-linux-gnu"
        "https://github.com/EAimTY/tuic/releases/download/tuic-server-${pkgver}/tuic-server-${pkgver}-x86_64-unknown-linux-gnu")

sha256sums=('8224772f1f363ee94870ca7b341845096dc1a0c99916fe9319e330c2d32ed0e7'
            '7cd85d8857cef7990ce067d8b48595e6532f0440522529d796d3a8b2f29e7b9f')

package() {
  install -Dm755 "tuic-client-${pkgver}-x86_64-unknown-linux-gnu" "${pkgdir}/usr/bin/tuic-client"
  install -Dm755 "tuic-server-${pkgver}-x86_64-unknown-linux-gnu" "${pkgdir}/usr/bin/tuic-server"
}

