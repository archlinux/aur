# Maintainer: Eduard Tolosa <edu4rdshl@protonmail.com>

pkgname=weakauras-companion-bin
pkgver=4.1.5
pkgrel=1
pkgdesc='A cross-platform application built to provide the missing link between Wago.io and World of Warcraft.'
url='https://github.com/WeakAuras/WeakAuras-Companion'
license=("GPL2")
arch=("x86_64")
depends=('libxshmfence' 'nss' 'at-spi2-atk' 'atk' 'libdrm' 'gdk-pixbuf2' 'gtk3')
source=("https://github.com/WeakAuras/WeakAuras-Companion/releases/download/v$pkgver/weakauras-companion_${pkgver}_amd64.deb")
sha512sums=('862aa9f09af97eeca4aa09172dd166745e06ecd0c25cdf10e74fb81fa689d331b17be95dfaf663e2ad2297f0856a82d2085b962aa23618cbca9e5d3b5ee42a82')


package() {
  install -dm 755 "$pkgdir/usr/bin/"

  # Extract package data
  tar xf data.tar.xz -C "${pkgdir}"

  ln -sf "/opt/WeakAuras Companion/weakauras-companion" "${pkgdir}/usr/bin/weakauras-companion"
}

