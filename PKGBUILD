# Maintainer: Eduard Tolosa <edu4rdshl@protonmail.com>

pkgname=weakauras-companion-bin
pkgver=5.3.1
pkgrel=1
pkgdesc='A cross-platform application built to provide the missing link between Wago.io and World of Warcraft.'
url='https://github.com/WeakAuras/WeakAuras-Companion'
license=("GPL2")
arch=("x86_64")
depends=('libxshmfence' 'nss' 'at-spi2-atk' 'atk' 'libdrm' 'gdk-pixbuf2' 'gtk3')
source=("https://github.com/WeakAuras/WeakAuras-Companion/releases/download/v$pkgver/weakauras-companion_${pkgver}_amd64.deb")
sha512sums=('6170807926daf26297de896c213e52e0a938c7431bae79e63ea9a87106b12e0f71bb00d26e9de84a27b3db172b38f9ced765e58b7e734703e8dbf8548d01e47a')


package() {
  # Extract package data
  tar xf data.tar.xz -C "${pkgdir}"
}

