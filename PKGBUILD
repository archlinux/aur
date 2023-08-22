# Maintainer: Eduard Tolosa <edu4rdshl@protonmail.com>

pkgname=weakauras-companion-bin
pkgver=5.1.1
pkgrel=1
pkgdesc='A cross-platform application built to provide the missing link between Wago.io and World of Warcraft.'
url='https://github.com/WeakAuras/WeakAuras-Companion'
license=("GPL2")
arch=("x86_64")
depends=('libxshmfence' 'nss' 'at-spi2-atk' 'atk' 'libdrm' 'gdk-pixbuf2' 'gtk3')
source=("https://github.com/WeakAuras/WeakAuras-Companion/releases/download/v$pkgver/weakauras-companion_${pkgver}_amd64.deb")
sha512sums=('67192c6ae5ee0d7eb146648ba7b823b55fce46cd07ca716a2b407ad941d3e9e8d477e2003473ed1fd78c3006921fc3abbaba08e13968a20fa2e1b487875a6614')


package() {
  install -dm 755 "$pkgdir/usr/bin/"

  # Extract package data
  tar xf data.tar.xz -C "${pkgdir}"

  ln -sf "/opt/WeakAuras Companion/weakauras-companion" "${pkgdir}/usr/bin/weakauras-companion"
}

